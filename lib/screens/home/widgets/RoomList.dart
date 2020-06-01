import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:chatrooms/redux/actions/public_rooms_actions/fetch_public_rooms.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state.dart';
import 'RoomList-View.dart';

class RoomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Room>>(
      onInit: (store) => store.dispatch(fetchPublicRooms(context)),
      converter: (store) => store.state.publicRooms,
      builder: (_, List<Room> publicRooms) => RoomListView(publicRooms),
    );
  }
}