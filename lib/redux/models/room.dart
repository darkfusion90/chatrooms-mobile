import 'package:chatrooms/redux/models/user.dart';
import 'package:flutter/cupertino.dart';

class RoomModel {
  final String id;
  final DateTime createdAt;
  final UserModel createdBy;
  String name;
  RoomType type;

  RoomModel({
    @required this.id,
    @required this.createdAt,
    @required this.createdBy,
    @required this.name,
    @required this.type,
  })  : assert(id != null),
        assert(createdAt != null),
        assert(createdBy != null),
        assert(name != null),
        assert(type != null);
}

enum RoomType { private, public, unlisted }

extension RoomTypeGetter on RoomType {
  bool _matches(RoomType other) => this == other;

  bool get isPrivate => _matches(RoomType.private);

  bool get isPublic => _matches(RoomType.public);

  bool get isUnlisted => _matches(RoomType.unlisted);
}
