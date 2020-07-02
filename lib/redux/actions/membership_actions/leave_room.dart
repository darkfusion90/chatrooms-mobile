import 'package:chatrooms/redux/actions/membership_actions/update_room_memberships.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> leaveRoom(RoomModel room) =>
    (Store<AppState> store) async {
    room.membership = await Api.roomMembership.leaveRoom(room);
    
    store.dispatch(UpdateRoomMembershipAction(room));
  };
