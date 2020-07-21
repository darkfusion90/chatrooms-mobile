import 'package:requests/requests.dart';

import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/services/api/api-branch.dart';
import 'package:chatrooms/services/api/api.dart';

class ApiRoomMessages {
  static final String _root = '${ApiBranch.rootUrl}/messages';

  static String root(RoomModel room, BranchModel branch) => ApiBranch.root(room,
      branch: branch, baseUrl: _root, includeBranch: false);

  Future<List<RoomMessage>> getMessages(
    RoomModel room,
    BranchModel branch,
  ) async {
    final String url = root(room, branch);
    final Map<String, dynamic> json = await Api.getJson(url);
    print('messages response json: , $json');
    List<dynamic> messages = json['messages'];

    return List<RoomMessage>.generate(
      messages.length,
      (index) => RoomMessage.fromJson(messages[index]),
    );
  }

  Future<void> sendMessage(
    RoomModel room,
    String message, [
    BranchModel branch,
  ]) =>
      Requests.post(root(room, branch), json: {'message': message});
}
