import 'package:chatrooms/redux/actions/active_room_actions/reset-active-room.dart';
import 'package:chatrooms/redux/actions/active_room_actions/set-active-room.dart';
import 'package:chatrooms/redux/models/room-member.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/selectors/active_room_selectors/active_room_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/shared/typedefs/typedef_param_widget_builder.dart';

class ActiveRoomConnector extends StatelessWidget {
  final ParameterizedWidgetBuilder<ActiveRoomViewModel> builder;

  const ActiveRoomConnector({@required this.builder}) : assert(builder != null);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (Store<AppState> store) => store,
      builder: (BuildContext context, Store<AppState> store) =>
          builder(context, _viewModel(store)),
    );
  }

  ActiveRoomViewModel _viewModel(Store<AppState> store) {
    final AppState state = store.state;

    return ActiveRoomViewModel(
      activeRoomSelector(state),
      activeRoomMembersSelector(state),
      activeRoomMessagesSelector(state),
      (RoomModel room) => store.dispatch(SetActiveRoomAction(room)),
      () => store.dispatch(ResetActiveRoomAction()),
    );
  }
}

class ActiveRoomViewModel {
  final RoomModel room;
  final List<RoomMember> roomMembers;
  final List<RoomMessage> roomMessages;

  final ValueChanged<RoomModel> setActiveRoom;
  final VoidCallback resetActiveRoom;

  ActiveRoomViewModel(
    this.room,
    this.roomMembers,
    this.roomMessages,
    this.setActiveRoom,
    this.resetActiveRoom,
  );
}
