import 'package:chatrooms/redux/models/room-membership.dart';
import 'package:chatrooms/redux/models/user.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';

class RoomModel {
  final String id;
  final DateTime createdAt;
  final UserModel createdBy;
  String name;
  RoomType type;
  RoomMembership membership;

  RoomModel({
    @required this.id,
    @required this.createdAt,
    @required this.createdBy,
    @required this.name,
    @required this.type,
    this.membership = RoomMembership.undetermined,
  })  : assert(id != null),
        assert(createdAt != null),
        assert(createdBy != null),
        assert(name != null),
        assert(type != null);

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json["_id"],
      name: json["name"],
      type: EnumToString.fromString(RoomType.values, json["type"]),
      createdBy: _parseCreatedBy(json["createdBy"]),
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "type": type,
        "createdBy": createdBy.toJson(),
        "createdAt": createdAt.toIso8601String(),
      };

  static UserModel _parseCreatedBy(dynamic createdBy) {
    return createdBy.runtimeType == String
        ? UserModel(createdBy, username: '')
        : UserModel.fromJson(createdBy);
  }

  bool get isMember => membership.isMember;

  bool get isParticipant => membership.isParticipant;

  bool get isAdmin => membership.isAdmin;

  bool get isMembershipUndetermined => membership.isUndetermined;

  @override
  String toString() => 'RoomModel('
      'id: $id,'
      'name: $name,'
      'type: $type,'
      'createdBy: $createdBy,'
      'createdAt: $createdAt,'
      ')';

  @override
  bool operator ==(other) => other is RoomModel && other.id == this.id;

  @override
  int get hashCode => id.hashCode;
}

enum RoomType { private, public, unlisted }

extension RoomTypeGetter on RoomType {
  bool _matches(RoomType other) => this == other;

  bool get isPrivate => _matches(RoomType.private);

  bool get isPublic => _matches(RoomType.public);

  bool get isUnlisted => _matches(RoomType.unlisted);
}
