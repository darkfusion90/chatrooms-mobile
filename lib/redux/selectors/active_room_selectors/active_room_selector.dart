import 'package:chatrooms/redux/models/room-member.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:reselect/reselect.dart';

final Selector<AppState, RoomModel> activeRoomSelector =
    (AppState state) => state.activeRoomState.room;

final Selector<AppState, List<RoomMessage>> activeRoomMessagesSelector =
    (AppState state) => state.activeRoomState.messages;

final Selector<AppState, List<RoomMember>> activeRoomMembersSelector =
    (AppState state) => state.activeRoomState.members;
