import 'package:chatrooms/redux/actions/membership_actions/join_room.dart';
import 'package:chatrooms/redux/actions/membership_actions/leave_room.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/shared/typedefs/typedef_param_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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
