import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:chatrooms/utils/send_message.dart';
import 'package:requests/requests.dart';

import 'api-rooms.dart';

class ApiRoomMessages {
  static final String _root = '${ApiRooms.root}/:roomId/messages';

  String root(RoomModel room) => _root.replaceAll(':roomId', room.id);

  Future<List<RoomMessage>> getMessages(RoomModel room) async {
    final messagesJson = await Api.getJson(root(room));
    if (messagesJson is! List<dynamic>) {
      print(
          'Json not a list. returning empty list. type: ${messagesJson.runtimeType}');
      return [];
    }

    return List<RoomMessage>.generate(
      messagesJson.length,
      (index) => RoomMessage.fromJson(messagesJson[index]),
    );
  }

  Future<void> sendMessage(RoomModel room, String message) async {
    await Requests.post(root(room), json: {'message': message});
  }
}
