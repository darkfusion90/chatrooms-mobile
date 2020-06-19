import 'package:chatrooms/redux/actions/membership_actions/update_room_memberships.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:chatrooms/redux/actions/public_rooms_actions/fetch_public_rooms.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/redux/selectors/rooms_selectors.dart'
    show roomListSelector;
import 'package:redux/redux.dart';
import 'RoomList-View.dart';

class RoomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      onInit: (store) => _refreshRoomListData(store, context),
      converter: (store) => store,
      builder: _buildView,
    );
  }

  Widget _buildView(BuildContext context, Store<AppState> store) {
    return RoomListView(
      roomListSelector(store.state),
      () => _refreshRoomListData(store, context),
    );
  }

  void _refreshRoomListData(Store<AppState> store, BuildContext context) =>
      store.dispatch(fetchPublicRooms(context));
}
