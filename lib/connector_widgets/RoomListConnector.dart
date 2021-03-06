import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:chatrooms/redux/actions/room_list_actions/fetch_public_rooms.dart';
import 'package:chatrooms/redux/actions/room_list_actions/fetch_joined_rooms.dart';
import 'package:chatrooms/redux/actions/room_list_actions/SetRoomListFilter.dart';

import 'package:chatrooms/redux/models/room.dart';

import 'package:chatrooms/redux/selectors/room_list_selectors/all_rooms_selector.dart';
import 'package:chatrooms/redux/selectors/room_list_selectors/joined_rooms_selector.dart';
import 'package:chatrooms/redux/selectors/room_list_selectors/public_rooms_selector.dart';

import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/shared/typedefs/typedef_param_widget_builder.dart';
import 'package:chatrooms/shared/typedefs/typedef_room_list_filter_cb.dart';

typedef void StoreCallback<S>(Store<S> store);

class RoomListConnector extends StatelessWidget {
  final RoomListCategory category;
  final ParameterizedWidgetBuilder<RoomListConnectorViewModel> builder;

  const RoomListConnector({@required this.builder, this.category})
      : assert(builder != null);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      onInit: _updateRoomList(category),
      converter: (store) => store,
      builder: (BuildContext context, Store<AppState> store) =>
          builder(context, _viewModel(store)),
    );
  }

  StoreCallback<AppState> _updateRoomList(RoomListCategory category) {
    switch (category) {
      case RoomListCategory.public:
        return _fetchPublicRooms;
      case RoomListCategory.joined:
        return _fetchJoinedRooms;
      default:
        //Some widgets won't need to update the store
        //Example: widgets only looking for filter, rooms, etc
        return (_) {};
    }
  }

  RoomListConnectorViewModel _viewModel(Store<AppState> store) =>
      RoomListConnectorViewModel(
        rooms: allRoomsSelector(store.state).rooms,
        publicRooms: filteredPublicRoomsSelector(store.state).rooms,
        fetchPublicRooms: () => _fetchPublicRooms(store),
        fetchJoinedRooms: () => _fetchJoinedRooms(store),
        joinedRooms: filteredJoinedRoomsSelector(store.state).rooms,
        setFilter: _setFilter(store),
        resetFilter: () => store.dispatch(resetRoomListFilterAction()),
      );

  void _fetchPublicRooms(Store<AppState> store) =>
      store.dispatch(fetchPublicRooms());

  void _fetchJoinedRooms(Store<AppState> store) =>
      store.dispatch(fetchJoinedRooms());

  RoomListFilterCallback _setFilter(Store<AppState> store) =>
      (filter) => store.dispatch(SetRoomListFilterAction(filter));
}

class RoomListConnectorViewModel {
  final List<RoomModel> rooms;
  final List<RoomModel> publicRooms;
  final VoidCallback fetchPublicRooms;
  final List<RoomModel> joinedRooms;
  final VoidCallback fetchJoinedRooms;
  final RoomListFilterCallback setFilter;
  final VoidCallback resetFilter;

  RoomListConnectorViewModel({
    this.rooms,
    this.publicRooms,
    this.fetchPublicRooms,
    this.joinedRooms,
    this.fetchJoinedRooms,
    this.setFilter,
    this.resetFilter,
  });
}

enum RoomListCategory { public, joined }
