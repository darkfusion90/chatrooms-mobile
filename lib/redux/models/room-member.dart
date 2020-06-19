import 'package:chatrooms/redux/models/room-membership.dart';
import 'package:chatrooms/redux/models/user.dart';

class RoomMember {
  final RoomMembership membership;
  final UserModel user;

  RoomMember(this.user, this.membership);
}
