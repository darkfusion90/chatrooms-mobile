import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:chatrooms/services/socket_io/SocketService.dart';

Future<void> sendMessage(
  RoomModel room,
  String message, [
  BranchModel branch,
]) async {
  await Api.roomMessages.sendMessage(room, message, branch);
  SocketService().sendMessage(room, message);
}
