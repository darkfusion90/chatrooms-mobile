import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/selectors/rooms_selectors.dart';
import 'package:reselect/reselect.dart';

import 'package:chatrooms/redux/models/room-membership.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/AppState.dart';

RoomMembershipModel membershipOf(AppState state, RoomModel room) {
  final Selector<AppState, RoomMembershipModel> membershipSelector =
      createSelector1<AppState, RoomListModel, RoomMembershipModel>(
    roomListSelector,
    (RoomListModel roomList) => roomList.getById(room.id).membership,
  );

  return membershipSelector(state);
}

bool isMemberOf(AppState state, RoomModel room) =>
    membershipOf(state, room).isMember;

bool isMembershipUndetermined(AppState state, RoomModel room) =>
    membershipOf(state, room).isUndetermined;
