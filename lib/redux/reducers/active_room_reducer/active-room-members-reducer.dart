import 'package:chatrooms/redux/actions/active_room_actions/update-active-room-members.dart';
import 'package:chatrooms/redux/models/room-member.dart';
import 'package:redux/redux.dart';

List<RoomMember> _updateMembers(_, UpdateActiveRoomMembersAction action) =>
    action.members;

final Reducer<List<RoomMember>> activeRoomMembersReducer = combineReducers([
  TypedReducer<List<RoomMember>, UpdateActiveRoomMembersAction>(_updateMembers),
]);
