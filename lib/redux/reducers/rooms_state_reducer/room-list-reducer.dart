import 'package:chatrooms/redux/actions/membership_actions/update_room_memberships.dart';
import 'package:chatrooms/redux/actions/public_rooms_actions/fetch_public_rooms.dart';
import 'package:chatrooms/redux/actions/room_list_actions/SetRoomListFilter.dart';
import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:redux/redux.dart';

RoomListModel _fetchPublicRoomsReducer(
  RoomListModel roomList,
  FetchPublicRooms action,
) =>
    RoomListModel(action.rooms);

RoomListModel _updateRoomMembershipReducer(
  RoomListModel roomList,
  UpdateRoomMembershipAction action,
) {
  roomList.replaceMatching(action.room);
  return roomList;
}

RoomListModel _updateRoomListFilter(
  RoomListModel roomList,
  SetRoomListFilterAction action,
) =>
    RoomListModel(roomList.rooms, filter: action.filter);

final Reducer<RoomListModel> roomListReducer = combineReducers<RoomListModel>([
  TypedReducer<RoomListModel, FetchPublicRooms>(_fetchPublicRoomsReducer),
  TypedReducer<RoomListModel, UpdateRoomMembershipAction>(
    _updateRoomMembershipReducer,
  ),
  TypedReducer<RoomListModel, SetRoomListFilterAction>(_updateRoomListFilter),
]);
