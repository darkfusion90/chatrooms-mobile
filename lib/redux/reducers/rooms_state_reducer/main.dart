import 'package:chatrooms/redux/reducers/rooms_state_reducer/room-list-reducer.dart';
import 'package:chatrooms/redux/state/RoomsState.dart';

RoomsState roomsStateReducer(RoomsState state, dynamic action) =>
    RoomsState(roomList: roomListReducer(state.roomList, action));
