import 'package:chatrooms/redux/actions/active_room_actions/update-active-room-messages.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:redux/redux.dart';

List<RoomMessage> _updateMessages(_, UpdateActiveRoomMessagesAction action) {
  print('action room messages update: ${action.messages}');
  return action.messages;
}

final Reducer<List<RoomMessage>> activeRoomMessagesReducer = combineReducers([
  TypedReducer<List<RoomMessage>, UpdateActiveRoomMessagesAction>(
    _updateMessages,
  )
]);
