import 'package:chatrooms/redux/actions/room_list_actions/fetch_joined_rooms.dart';
import 'package:redux/redux.dart';

import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/reducers/rooms_state_reducer/room_list_membership_reducer.dart';

RoomListModel _updateJoinedRooms(_, SetJoinedRoomsAction action) =>
    RoomListModel(action.rooms);

final Reducer<RoomListModel> joinedRoomsReducer = combineReducers([
  TypedReducer<RoomListModel, SetJoinedRoomsAction>(_updateJoinedRooms),
  roomListMembershipReducer,
]);
