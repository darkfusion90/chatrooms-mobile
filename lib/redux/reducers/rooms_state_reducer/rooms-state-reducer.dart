import 'package:chatrooms/redux/reducers/rooms_state_reducer/joined_rooms_reducer.dart';
import 'package:chatrooms/redux/reducers/rooms_state_reducer/public_rooms_reducer.dart';
import 'package:chatrooms/redux/reducers/rooms_state_reducer/room_list_filter_reducer.dart';
import 'package:chatrooms/redux/state/RoomsState.dart';

RoomsState roomsStateReducer(RoomsState state, dynamic action) => RoomsState(
      publicRooms: publicRoomsReducer(state.publicRooms, action),
      joinedRooms: joinedRoomsReducer(state.joinedRooms, action),
      filter: roomListFilterReducer(state.filter, action),
    );
