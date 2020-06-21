import 'package:chatrooms/services/api/api.dart';
import 'package:chatrooms/services/api/config.dart';
import 'package:chatrooms/redux/models/room.dart';

class ApiRooms {
  static final String root = ApiConfig.createUrl('rooms');

  Future<List<RoomModel>> get rooms async {
    List<dynamic> jsonList = await Api.getJson(root);
    return jsonList.map((json) => RoomModel.fromJson(json)).toList();
  }
}
