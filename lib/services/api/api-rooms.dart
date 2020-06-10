import 'utils.dart' as utils;
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/services/api/config.dart';

class ApiRooms {
  static final String root = ApiConfig.createUrl('rooms');

  Future<List<RoomModel>> get rooms async {
    List<dynamic> jsonList = await utils.getJsonResponse(root);
    return jsonList.map((json) => RoomModel.fromJson(json)).toList();
  }
}
