import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/utils/url-provider.dart';
import 'package:share/share.dart' show Share;

abstract class AppShareUtils {
  static void shareRoom(RoomModel room) {
    Share.share(
      'Room info for room: "${room.name}"'
      'Visit room using this link: ${UrlProvider.createRoomUrl(room)}',
    );
  }
}
