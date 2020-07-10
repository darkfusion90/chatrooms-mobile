import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/room_list_actions/fetch_public_rooms.dart';
import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/reducers/rooms_state_reducer/room_list_membership_reducer.dart';

RoomListModel _publicRoomsReducer(_, SetPublicRoomsAction action) =>
    RoomListModel(action.rooms);

final Reducer<RoomListModel> publicRoomsReducer = combineReducers([
  TypedReducer<RoomListModel, SetPublicRoomsAction>(_publicRoomsReducer),
  roomListMembershipReducer,
]);
