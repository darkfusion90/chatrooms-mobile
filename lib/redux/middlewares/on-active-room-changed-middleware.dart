import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/active_room_actions/update-active-room-members.dart';
import 'package:chatrooms/redux/actions/branch_actions/update-branch-list.dart';
import 'package:chatrooms/redux/actions/active_room_actions/set-active-room.dart';
import 'package:chatrooms/redux/state/AppState.dart';

dynamic _middleware(
  Store<AppState> store,
  SetActiveRoomAction action,
  NextDispatcher next,
) {
  store.dispatch(updateBranchList(action.room));
  store.dispatch(updateActiveRoomMembers(action.room));
  next(action);
}

final onActiveRoomChangedMiddleware =
    TypedMiddleware<AppState, SetActiveRoomAction>(_middleware);
