import 'package:chatrooms/services/api/api-room-membership.dart';
import 'package:chatrooms/services/api/api-room-messages.dart';
import 'package:chatrooms/services/api/api-rooms.dart';

class Api {
  static final ApiRooms rooms = ApiRooms();
  static final ApiRoomMembership roomMembership = ApiRoomMembership();
  static final ApiRoomMessages roomMessages = ApiRoomMessages();
}
