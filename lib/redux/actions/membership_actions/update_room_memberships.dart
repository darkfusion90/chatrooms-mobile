import 'package:chatrooms/redux/models/account.dart';
import 'package:chatrooms/redux/selectors/account_selectors/account_selector.dart';
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

Future<void> _dispatch(
  Store<AppState> store,
  AccountModel account,
  RoomModel room,
) async {
  final String userId = account?.user?.id ?? userIdSelector(store.state);
  if (userId == null) {
    print('uid null. returning');
    return;
  }

  room.membership = await Api.roomMembership.getMembership(
    room,
    userId,
  );

  store.dispatch(UpdateRoomMembershipAction(room));
}

ThunkAction<AppState> updateRoomMemberships([AccountModel account]) {
  return (Store<AppState> store) => roomsSelector(store.state)
      .forEach((RoomModel room) => _dispatch(store, account, room));
}
