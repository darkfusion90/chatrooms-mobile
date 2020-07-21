import 'package:chatrooms/redux/models/room-member.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/BranchState.dart';
import 'package:chatrooms/redux/state/state_interface.dart';
import 'package:flutter/cupertino.dart';

class ActiveRoomState extends ReduxState {
  final RoomModel room;
  final BranchState branchState;
  final List<RoomMessage> messages;
  final List<RoomMember> members;

  ActiveRoomState({
    @required this.room,
    @required this.branchState,
    @required this.messages,
    @required this.members,
  })  : assert(messages != null),
        assert(members != null);

  factory ActiveRoomState.init() => ActiveRoomState(
        room: null,
        branchState: BranchState.init(),
        members: [],
        messages: [],
      );

  @override
  bool compareState(other) {
    return other is ActiveRoomState &&
        other.room == room &&
        other.branchState == branchState &&
        other.messages == messages &&
        other.members == members;
  }

  @override
  int getHashCode() {
    return room.hashCode ^
        branchState.hashCode ^
        messages.hashCode ^
        members.hashCode;
  }
}
