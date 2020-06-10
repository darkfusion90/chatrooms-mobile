import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/state/state_interface.dart';
import 'package:flutter/cupertino.dart';

class RoomsState implements ReduxState {
  final RoomListModel roomList;

  RoomsState({@required this.roomList}) : assert(roomList != null);

  factory RoomsState.init() => RoomsState(roomList: RoomListModel.empty());

  // Creates an instance by applying all properties of state while
  // overriding them with the optional named arguments if provided
  factory RoomsState.apply(RoomsState state, {RoomListModel roomList}) =>
      RoomsState(roomList: roomList ?? state.roomList);

  @override
  String toString() => 'RoomsState(\n'
      'roomList: $roomList\n'
      ')';

  @override
  bool compareState(other) {
    return other is RoomsState && other.roomList == roomList;
  }

  @override
  int getHashCode() => roomList.hashCode;
}
