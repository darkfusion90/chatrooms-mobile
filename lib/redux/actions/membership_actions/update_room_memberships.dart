import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/selectors/rooms_selectors.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart' show Api;

class UpdateRoomMembershipAction {
  final RoomModel room;

  UpdateRoomMembershipAction(this.room);
}

Future<void> _dispatch(Store<AppState> store, RoomModel room) async {
  room.membership = await Api.roomMembership.getMembership(room);
  store.dispatch(UpdateRoomMembershipAction(room));
}

ThunkAction<AppState> updateRoomMemberships() {
  print('update room membership before thunk');
  return (Store<AppState> store) =>
      roomsSelector(store.state).forEach((RoomModel room) {
        print('For Each dispatch: $room');
        _dispatch(store, room);
      });
}
