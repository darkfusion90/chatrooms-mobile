import 'package:chatrooms/redux/models/room-member.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/models/room.dart';

class RoomDetailsModel {
  final RoomModel room;
  final List<RoomMember> members;
  final List<RoomMessage> messages;

  RoomDetailsModel(this.room, this.members, this.messages);
}