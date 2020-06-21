import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/utils/app_utils.dart';

abstract class UrlProvider {
  static String get homeUrl => AppUtils.isDevMode
      ? AppDotEnv.developmentHomeUrl
      : AppDotEnv.productionHomeUrl;

  static String get apiRootUrl => '$homeUrl/api';

  static String get roomsUrl => '$apiRootUrl/rooms/';

  static String createRoomUrl(RoomModel room) => '$roomsUrl/${room.id}/';
}
