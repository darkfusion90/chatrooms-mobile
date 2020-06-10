import 'package:chatrooms/redux/actions/public_rooms_actions/room_list_changed.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/src/store.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> fetchPublicRooms(BuildContext context) {
  print('ThunkAction dispatch: fetchPublicRooms');
  return (Store<AppState> store) async {
    print('Async fetchPublicRooms started');
    try {
      final List<RoomModel> rooms = await Api.apiRooms.rooms;
      print('Async fetchPublicRooms succeeded: $rooms');
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
