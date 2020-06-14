import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/utils/app_utils.dart';

abstract class UrlProvider {
  static String get rootUrl => AppUtils.isDevMode
      ? AppDotEnv.developmentApiUrl
      : AppDotEnv.productionApiUrl;

  static String get roomsUrl => '$rootUrl/rooms/';

  static String createRoomUrl(RoomModel room) => '$roomsUrl/${room.id}/';
}
