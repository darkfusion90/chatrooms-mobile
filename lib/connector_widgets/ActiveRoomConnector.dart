import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/active_room_actions/reset-active-room.dart';
import 'package:chatrooms/redux/actions/active_room_actions/set-active-room.dart';
import 'package:chatrooms/redux/models/room_details_model.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/selectors/active_room_selectors/active_room_selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';

import 'package:chatrooms/connector_widgets/RoomActionsConnector.dart';
import 'package:chatrooms/shared/typedefs/typedef_param_widget_builder.dart';

typedef void RoomCallback(RoomModel room);

class ActiveRoomConnector extends StatelessWidget {
  final ParameterizedWidgetBuilder<ActiveRoomViewModel> builder;

  const ActiveRoomConnector({@required this.builder}) : assert(builder != null);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (Store<AppState> store) => store,
      builder: (BuildContext context, Store<AppState> store) =>
          RoomActionsConnector(
        room: activeRoomSelector(store.state),
        builder: (_, roomActions) => builder(
          context,
          _viewModel(store, roomActions),
        ),
      ),
    );
  }

  ActiveRoomViewModel _viewModel(
    Store<AppState> store,
    RoomActionsViewModel roomActions,
  ) =>
      ActiveRoomViewModel(
        roomDetails: _activeRoomDetails(store),
        roomActions: roomActions,
        setActiveRoom: _setActiveRoom(store),
        resetActiveRoom: _resetActiveRoom(store),
      );

  RoomDetailsModel _activeRoomDetails(Store<AppState> store) =>
      RoomDetailsModel(
        activeRoomSelector(store.state),
        activeRoomMembersSelector(store.state),
        activeRoomMessagesSelector(store.state),
      );

  RoomCallback _setActiveRoom(Store<AppState> store) =>
      (RoomModel room) => store.dispatch(SetActiveRoomAction(room));

  VoidCallback _resetActiveRoom(Store<AppState> store) =>
      () => store.dispatch(ResetActiveRoomAction());
}

class ActiveRoomViewModel {
  final RoomDetailsModel roomDetails;
  final RoomActionsViewModel roomActions;

  final RoomCallback setActiveRoom;
  final VoidCallback resetActiveRoom;

  ActiveRoomViewModel({
    this.roomDetails,
    this.roomActions,
    this.setActiveRoom,
    this.resetActiveRoom,
  });
}
