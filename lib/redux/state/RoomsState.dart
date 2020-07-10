import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/models/room_list/room_list_filter.dart';
import 'package:chatrooms/redux/state/state_interface.dart';
import 'package:flutter/cupertino.dart';

class RoomsState implements ReduxState {
  final RoomListModel publicRooms;
  final RoomListModel joinedRooms;
  final RoomListFilter filter;

  RoomsState({
    @required this.publicRooms,
    @required this.joinedRooms,
    @required this.filter,
  })  : assert(publicRooms != null),
        assert(joinedRooms != null);

  factory RoomsState.init() => RoomsState(
        publicRooms: RoomListModel.empty(),
        joinedRooms: RoomListModel.empty(),
        filter: RoomListFilter.noFilter,
      );

  @override
  String toString() => 'RoomsState(\n'
      'roomList: $publicRooms,\n'
      'joinedRooms: $joinedRooms,\n'
      'filter: $filter,\n'
      ')';

  @override
  bool compareState(other) {
    return other is RoomsState &&
        other.publicRooms == publicRooms &&
        other.joinedRooms == joinedRooms &&
        other.filter == filter;
  }

  @override
  int getHashCode() =>
      publicRooms.hashCode ^ joinedRooms.hashCode ^ filter.hashCode;
}
