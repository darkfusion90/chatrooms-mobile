import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:chatrooms/redux/actions/public_rooms_actions/fetch_public_rooms.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/redux/selectors/rooms_selectors.dart'
    show roomListSelector;
import 'RoomList-View.dart';

class RoomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RoomListModel>(
      onInit: (store) => store.dispatch(fetchPublicRooms(context)),
      converter: (store) => roomListSelector(store.state),
      builder: (_, RoomListModel roomList) => RoomListView(roomList),
    );
  }
}
