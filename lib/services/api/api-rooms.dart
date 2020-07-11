import 'package:chatrooms/services/api/api-user.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:chatrooms/services/api/config.dart';
import 'package:chatrooms/redux/models/room.dart';

class ApiRooms {
  static final String _rootName = 'rooms';
  static final String root = ApiConfig.createUrl(_rootName);

  Future<List<RoomModel>> get rooms async {
    List<dynamic> jsonList = await Api.getJson(root);
    return _parseRoomList(jsonList);
  }

  Future<List<RoomModel>> get joinedRooms async {
    Map<String, dynamic> json = await Api.getJson('${ApiUser.root}/$_rootName');
    List<dynamic> jsonList = json['rooms'];

    return _parseRoomList(jsonList);
  }

  List<RoomModel> _parseRoomList(List<dynamic> jsonList) =>
      jsonList.map((json) => RoomModel.fromJson(json)).toList();
}
