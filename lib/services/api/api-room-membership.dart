import 'package:chatrooms/redux/models/room-membership.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/services/api/api-rooms.dart';
import 'package:requests/requests.dart';

class ApiRoomMembership {
  static final String _root = '${ApiRooms.root}/:roomId/members';

  String root(String roomId) => _root.replaceAll(':roomId', roomId);

  Future<RoomMembership> getMembership(RoomModel room, String userId) async {
    final String url = '${root(room.id)}/byuid/$userId';

    Response response = await Requests.get(url);
    if (response.statusCode == 404) {
      return RoomMembership.notAMember(room);
    } else if (response.statusCode == 200) {
      return RoomMembership.fromJson(response.json());
    } else {
      return RoomMembership.undetermined;
    }
  }

  Future<RoomMembership> joinRoom(RoomModel room) async {
    Response response = await Requests.post(root(room.id));

    return RoomMembership.fromJson(response.json(), room: room);
  }

  Future<RoomMembership> leaveRoom(RoomModel room) async {
    final String url = '${root(room.id)}/${room.membership.id}';
    Response response = await Requests.delete(url);

    if (response.success) {
      return RoomMembership.notAMember(room);
    }

    return room.membership;
  }
}
