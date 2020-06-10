import 'dart:convert';

import 'package:chatrooms/redux/models/room-membership.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/services/api/api-rooms.dart';
import 'package:http/http.dart' as http;
import 'package:chatrooms/services/api/utils.dart' as utils;

class ApiRoomMembership {
  static final String _root = '${ApiRooms.root}/:roomId/members';

  String root(String roomId) => _root.replaceAll(':roomId', roomId);

  Future<RoomMembershipModel> getMembership(RoomModel room) async {
    final String url =
        '${root(room.id)}/byuid/5e64e8a8f7a63e19e7bfc2e8'; //username: tony_stark
    print('root: $_root');
    print('url: $url');
    http.Response response = await http.get(url);
    if (response.statusCode == 404) {
      return RoomMembershipModel.notAMember(room);
    } else if (response.statusCode == 200) {
      return RoomMembershipModel.fromJson(jsonDecode(response.body));
    } else {
      return RoomMembershipModel.undetermined;
    }
  }
}
