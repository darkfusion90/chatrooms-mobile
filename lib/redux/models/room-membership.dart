import 'package:chatrooms/redux/models/room.dart';
import 'package:enum_to_string/enum_to_string.dart';

class RoomMembershipModel {
  static const undetermined = RoomMembershipModel(null, null, null);

  final String id;
  final RoomModel room;
  final RoomMembershipType type;

  const RoomMembershipModel(this.id, this.room, this.type);

  factory RoomMembershipModel.fromJson(Map<String, dynamic> json) =>
      RoomMembershipModel(
        json['_id'],
        RoomModel.fromJson(json['room']),
        EnumToString.fromString(
            RoomMembershipType.values, json['membershipType']),
      );

  factory RoomMembershipModel.notAMember(RoomModel room) =>
      RoomMembershipModel(null, room, RoomMembershipType.notMember);

  bool get isMember => type.isMember;

  bool get isAdmin => type.isAdmin;

  bool get isParticipant => type.isParticipant;

  bool get isUndetermined => this == undetermined;

  @override
  bool operator ==(other) =>
      other is RoomMembershipModel &&
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
