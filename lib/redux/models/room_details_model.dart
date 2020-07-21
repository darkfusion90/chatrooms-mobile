import 'package:chatrooms/redux/models/room-member.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/models/room.dart';

import 'branch.dart';

class RoomDetailsModel {
  final RoomModel room;
  final List<BranchModel> branches;
  final BranchModel currentBranch;
  final List<RoomMember> members;
  final List<RoomMessage> messages;

  RoomDetailsModel({
    this.room,
    this.branches,
    this.currentBranch,
    this.members,
    this.messages,
  });
}
