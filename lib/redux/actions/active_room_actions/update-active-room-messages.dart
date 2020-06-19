import 'package:chatrooms/redux/actions/active_room_actions/set-active-room.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/selectors/active_room_selectors/active_room_selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class UpdateActiveRoomMessagesAction {
  final List<RoomMessage> messages;

  UpdateActiveRoomMessagesAction(this.messages);
}

ThunkAction<AppState> updateActiveRoomMessages([SetActiveRoomAction action]) {
  return (Store<AppState> store) async {
    final RoomModel activeRoom =
        action == null ? activeRoomSelector(store.state) : action.room;

    print('active room: $activeRoom');
    List<RoomMessage> messages = await Api.roomMessages.getMessages(activeRoom);

    store.dispatch(UpdateActiveRoomMessagesAction(messages));
  };
}
