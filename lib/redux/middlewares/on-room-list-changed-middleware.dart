import 'package:chatrooms/redux/actions/membership_actions/update_room_memberships.dart';
import 'package:chatrooms/redux/actions/public_rooms_actions/room_list_changed.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:redux/redux.dart';

dynamic _middleware(
  Store<AppState> store,
  RoomListChangedAction action,
  NextDispatcher next,
) {
  store.dispatch(updateRoomMemberships());
  next(action);
}

final onRoomListChangedMiddleware =
    TypedMiddleware<AppState, RoomListChangedAction>(_middleware);
