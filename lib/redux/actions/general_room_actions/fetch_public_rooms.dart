import 'package:chatrooms/redux/actions/general_room_actions/room_list_changed.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';

import 'package:redux/src/store.dart' show Store;
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> fetchPublicRooms() {
  return (Store<AppState> store) async {
    try {
      final List<RoomModel> rooms = await Api.rooms.rooms;
      store.dispatch(FetchPublicRooms(rooms));
      store.dispatch(RoomListChangedAction());
    } catch (on, stackTrace) {
      print('Error fetching rooms: $on\nStack Trace: $stackTrace');
    }
  };
}

class FetchPublicRooms {
  final List<RoomModel> rooms;

  const FetchPublicRooms(this.rooms);
}
