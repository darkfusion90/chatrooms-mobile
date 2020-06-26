import 'package:chatrooms/redux/models/room-member.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/ActiveRoomState.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:reselect/reselect.dart';

final Selector<AppState, ActiveRoomState> activeRoomStateSelector =
    (AppState state) => state.activeRoomState;

final Selector<AppState, RoomModel> activeRoomSelector = createSelector1(
  activeRoomStateSelector,
  (ActiveRoomState state) => state.room,
);

final Selector<AppState, List<RoomMessage>> activeRoomMessagesSelector =
    createSelector1(
  activeRoomStateSelector,
  (ActiveRoomState state) => state.messages,
);

final Selector<AppState, List<RoomMember>> activeRoomMembersSelector =
    createSelector1(
  activeRoomStateSelector,
  (ActiveRoomState state) => state.members,
);
