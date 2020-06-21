import 'package:chatrooms/redux/models/user.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';

class RoomMessage {
  final String id;
  final String roomId;
  final UserModel author;
  final String data;
  final DateTime createdAt;

  RoomMessage({
    @required this.id,
    @required this.roomId,
    @required this.author,
    @required this.data,
    @required this.createdAt,
  })  : assert(id != null),
        assert(roomId != null),
        assert(author != null),
        assert(data != null),
        assert(createdAt != null);

  factory RoomMessage.fromJson(Map<String, dynamic> json) {
    return RoomMessage(
      id: json['_id'],
      roomId: json['atRoom'],
      author: UserModel.fromJson(json['author']),
      data: json['data'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  ChatMessage asChatMessage() => ChatMessage(
        id: id,
        text: data,
        user: author.asChatUser(),
        createdAt: createdAt,
      );

  @override
  bool operator ==(other) =>
      other is RoomMessage &&
      other.roomId == roomId &&
      other.data == data &&
      other.author == author &&
      other.createdAt == createdAt;

  @override
  int get hashCode =>
      roomId.hashCode ^ data.hashCode ^ author.hashCode ^ createdAt.hashCode;
}
