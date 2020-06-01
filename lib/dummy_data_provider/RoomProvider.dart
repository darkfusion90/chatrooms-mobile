import 'dart:convert';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/models/user.dart';
import 'package:flutter/cupertino.dart';

abstract class RoomsProvider {
  static Future<List<Room>> rooms(BuildContext context) async {
    final String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/json/rooms.json');

    final Map<String, dynamic> json = JsonDecoder().convert(jsonString);
    final List<dynamic> roomsJson = json['rooms'];
    print('roomsJson: $roomsJson');

    final List<Room> roomsParsed = List<Room>.generate(
      roomsJson.length,
      (index) => _castRoom(roomsJson[index]),
    );

    return roomsParsed;
  }

  static Room _castRoom(Map<String, dynamic> data) {
    final String createdAtRaw = data['createdAt']['\$date']['\$numberLong'];

    return Room(
      id: data['_id'],
      name: data['name'],
      type: _castRoomType(data['type']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(int.parse(createdAtRaw)),
      createdBy: User('1', username: 'Heisenberg'),
    );
  }

  static RoomType _castRoomType(String type) {
    switch (type) {
      case 'private':
        return RoomType.private;
      case 'public':
        return RoomType.public;
      case 'unlisted':
        return RoomType.unlisted;
      default:
        throw Exception('Unknown room type: $type');
    }
  }
}
