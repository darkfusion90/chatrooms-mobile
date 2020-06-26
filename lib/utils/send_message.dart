import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:chatrooms/services/socket_io/SocketService.dart';

Future<void> sendMessage(RoomModel room, String message) async {
  await Api.roomMessages.sendMessage(room, message);
  SocketService().sendMessage(room, message);
}
