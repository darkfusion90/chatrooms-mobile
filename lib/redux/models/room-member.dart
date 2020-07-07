import 'package:chatrooms/redux/models/room-membership.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/models/user.dart';
import 'package:enum_to_string/enum_to_string.dart';

class RoomMember {
  final RoomModel room;
  final UserModel user;
  final RoomMembershipType membershipType;

  RoomMember(this.room, this.user, this.membershipType);

  factory RoomMember.fromJson(Map<String, dynamic> json) => RoomMember(
        RoomModel.fromJson(json['room']),
        UserModel.fromJson(json['user']),
        EnumToString.fromString(RoomMembershipType.values, json['memberType']),
      );

  bool get isAdmin => membershipType.isAdmin;

  bool get isParticipant => membershipType.isParticipant;

  @override
  String toString() => 'RoomMember(room: $room,\n'
      'user: $user,\n'
      'membership: $membershipType,\n'
      ')';
}
