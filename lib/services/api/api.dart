import 'package:requests/requests.dart';

import 'package:chatrooms/services/api/api-room-membership.dart';
import 'package:chatrooms/services/api/api-room-messages.dart';
import 'package:chatrooms/services/api/api-rooms.dart';

import 'api-user.dart';

class Api {
  static final ApiRooms rooms = ApiRooms();
  static final ApiRoomMembership roomMembership = ApiRoomMembership();
  static final ApiRoomMessages roomMessages = ApiRoomMessages();
  static final ApiUser user = ApiUser();

  static Future<dynamic> getJson(String url) async {
    Response response = await Requests.get(url);
    return response.json();
  }
}
