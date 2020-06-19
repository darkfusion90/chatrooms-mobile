import 'package:chatrooms/redux/reducers/active_room_reducer/active-room-members-reducer.dart';
import 'package:chatrooms/redux/reducers/active_room_reducer/active-room-messages-reducer.dart';
import 'package:chatrooms/redux/reducers/active_room_reducer/active-room-reducer.dart';
import 'package:chatrooms/redux/state/ActiveRoomState.dart';

ActiveRoomState activeRoomStateReducer(ActiveRoomState state, dynamic action) =>
    ActiveRoomState(
      room: activeRoomReducer(state.room, action),
      messages: activeRoomMessagesReducer(state.messages, action),
      members: activeRoomMembersReducer(state.members, action),
    );
