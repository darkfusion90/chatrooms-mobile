import 'package:chatrooms/redux/actions/room_list_actions/room_list_changed.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> fetchJoinedRooms() {
  return (Store<AppState> store) async {
    try {
      final List<RoomModel> rooms = await Api.rooms.joinedRooms;
      store.dispatch(SetJoinedRoomsAction(rooms));
      store.dispatch(RoomListChangedAction());
    } catch (on, stackTrace) {
      print('Error fetching joined rooms: $on\nStack Trace: $stackTrace');
    }
  };
}

class SetJoinedRoomsAction {
  final List<RoomModel> rooms;

  const SetJoinedRoomsAction(this.rooms);
}
