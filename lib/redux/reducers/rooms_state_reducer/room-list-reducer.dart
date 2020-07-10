import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/membership_actions/update_room_memberships.dart';
import 'package:chatrooms/redux/actions/room_list_actions/fetch_public_rooms.dart';
import 'package:chatrooms/redux/models/room_list/room_list.dart';

RoomListModel _fetchPublicRoomsReducer(
  RoomListModel roomList,
  SetPublicRoomsAction action,
) =>
    RoomListModel(action.rooms);

RoomListModel _updateRoomMembershipReducer(
  RoomListModel roomList,
  UpdateRoomMembershipAction action,
) {
  roomList.replaceMatching(action.room);
  return roomList;
}

final Reducer<RoomListModel> roomListReducer = combineReducers<RoomListModel>([
  TypedReducer<RoomListModel, SetPublicRoomsAction>(_fetchPublicRoomsReducer),
  TypedReducer<RoomListModel, UpdateRoomMembershipAction>(
    _updateRoomMembershipReducer,
  ),
]);
