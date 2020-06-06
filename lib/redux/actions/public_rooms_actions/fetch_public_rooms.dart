import 'package:chatrooms/dummy_data_provider/RoomProvider.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/src/store.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> fetchPublicRooms(BuildContext context) {
  print('ThunkAction dispatch: fetchPublicRooms');
  return (Store<AppState> store) async {
    print('Async fetchPublicRooms started');
    try {
      final List<RoomModel> rooms = await RoomsProvider.rooms(context);
      print('Async fetchPublicRooms succeeded: $rooms');
      store.dispatch(FetchPublicRooms(rooms));
    } catch (on, stackTrace) {
      print('Error fetching rooms: $on\nStack Trace: $stackTrace');
    }
  };
}

class FetchPublicRooms {
  final List<RoomModel> rooms;

  const FetchPublicRooms(this.rooms);
}
