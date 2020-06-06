import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/state/state_interface.dart';

class RoomsState implements ReduxState {
  final RoomListModel roomList;

  RoomsState({this.roomList});

  factory RoomsState.init() => RoomsState(roomList: RoomListModel.empty());

  // Creates an instance by applying all properties of state while
  // overriding them with the optional named arguments if provided
  factory RoomsState.apply(RoomsState state, {RoomListModel roomList}) {
    roomList = roomList ?? state.roomList;
    return RoomsState(roomList: roomList);
  }

  @override
  bool compareState(other) {
    return other is RoomsState && other.roomList == roomList;
  }

  @override
  int getHashCode() => roomList.hashCode;
}
