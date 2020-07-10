import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:chatrooms/redux/actions/membership_actions/join_room.dart';
import 'package:chatrooms/redux/actions/membership_actions/leave_room.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/AppState.dart';

import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogManager.dart';
import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogNames.dart';
import 'package:chatrooms/widgets/dialogs/leave_room_confirmation.dart';

import 'package:chatrooms/shared/typedefs/typedef_param_widget_builder.dart';
import 'package:chatrooms/flushbar/flushbar_store.dart';

void _doNothing() {}

class RoomActionsConnector extends StatelessWidget {
  final RoomModel room;
  final ParameterizedWidgetBuilder<RoomActionsViewModel> builder;

  const RoomActionsConnector({
    this.room,
    @required this.builder,
  }) : assert(builder != null);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RoomActionsViewModel>(
      converter: (Store<AppState> store) => _viewModel(store),
      builder: builder,
    );
  }

  RoomActionsViewModel _viewModel(Store<AppState> store) {
    final VoidCallback onJoinRoom = () => store.dispatch(joinRoom(this.room));
    final VoidCallback onLeaveRoom = () => store.dispatch(leaveRoom(this.room));

    return RoomActionsViewModel(
      this.room,
      room == null ? _doNothing : onJoinRoom,
      room == null ? _doNothing : onLeaveRoom,
    );
  }
}

class RoomActionsViewModel {
  final RoomModel room;
  final VoidCallback joinRoom;
  final VoidCallback leaveRoom;

  RoomActionsViewModel(this.room, this.joinRoom, this.leaveRoom);
}

class LeaveRoomConfirmation {
  final BuildContext context;

  LeaveRoomConfirmation(this.context);

  factory LeaveRoomConfirmation.of(BuildContext context) =>
      LeaveRoomConfirmation(context);

  void show(RoomActionsViewModel viewModel) {
    final RoomModel room = viewModel.room;

    if (room.type.isPrivate) {
      DialogManager.of(context).show(
        DialogName.leaveRoomConfirmation,
        arguments: LeaveRoomConfirmationArguments(room: room),
      );
    } else {
      FlushbarStore.leaveRoomSuccessful(
        context,
        room: room,
        onUndoLeaveRoom: viewModel.joinRoom,
      ).show(context);
    }
  }
}
