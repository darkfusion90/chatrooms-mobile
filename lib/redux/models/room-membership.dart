import 'package:chatrooms/redux/models/room.dart';
import 'package:enum_to_string/enum_to_string.dart';

class RoomMembership {
  static const undetermined = RoomMembership(null, null, null);

  final String id;
  final RoomModel room;
  final RoomMembershipType type;

  const RoomMembership(this.id, this.room, this.type);

  factory RoomMembership.fromJson(
    Map<String, dynamic> json, {
    String id,
    RoomModel room,
    RoomMembershipType type,
  }) =>
      RoomMembership(
        id ?? _idFromJson(json),
        room ?? _roomFromJson(json),
        type ?? _membershipTypeFromJson(json),
      );

  factory RoomMembership.notAMember(RoomModel room) =>
      RoomMembership(null, room, RoomMembershipType.notMember);

  static RoomMembershipType _membershipTypeFromJson(
          Map<String, dynamic> json) =>
      EnumToString.fromString(
        RoomMembershipType.values,
        json['membershipType'],
      );

  static RoomModel _roomFromJson(Map<String, dynamic> json) =>
      RoomModel.fromJson(json['room']);

  static String _idFromJson(Map<String, dynamic> json) => json['_id'];

  bool get isMember => !isUndetermined && type.isMember;

  bool get isNotMember => !isUndetermined && type.isNotMember;
  
    bool get isAdmin => !isUndetermined && type.isAdmin;

  bool get isParticipant => !isUndetermined && type.isParticipant;

  bool get isUndetermined => this == undetermined;

  @override
  bool operator ==(other) =>
      other is RoomMembership &&
      other.type == this.type &&
      other.room == this.room;

  @override
  int get hashCode => type.hashCode ^ room.hashCode;
}

enum RoomMembershipType { admin, participant, notMember }

extension RoomMembershipTypeGetter on RoomMembershipType {
  bool _matches(other) => other == this;

  bool get isMember => !_matches(RoomMembershipType.notMember);

  bool get isNotMember => !isMember;

  bool get isAdmin => _matches(RoomMembershipType.admin);

  bool get isParticipant => _matches(RoomMembershipType.participant);
}
