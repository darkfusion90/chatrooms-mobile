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

enum RoomType { private, public, unlisted }
