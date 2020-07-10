import 'package:chatrooms/redux/actions/membership_actions/update_room_memberships.dart';
import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:redux/redux.dart';

RoomListModel _reducer(
  RoomListModel roomList,
  UpdateRoomMembershipAction action,
) {
  roomList.replaceMatching(action.room);
  return roomList;
}

final Reducer<RoomListModel> roomListMembershipReducer = combineReducers([
  TypedReducer<RoomListModel, UpdateRoomMembershipAction>(_reducer),
]);
