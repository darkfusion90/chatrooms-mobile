import 'package:chatrooms/redux/models/user.dart';
import 'package:flutter/cupertino.dart';

class Room {
  final String id;
  final DateTime createdAt;
  final User createdBy;
  String name;
  RoomType type;

  Room({
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

class PublicRoom extends Room {
  PublicRoom({
    @required String id,
    @required DateTime createdAt,
    @required User createdBy,
    @required String name,
  }) : super(
          id: id,
          createdAt: createdAt,
          createdBy: createdBy,
          name: name,
          type: RoomType.public,
        );
}

enum RoomType { private, public }
