import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/active_room_actions/update-active-room-messages.dart';
import 'package:chatrooms/redux/actions/branch_actions/update-current-branch.dart';
import 'package:chatrooms/redux/state/AppState.dart';

dynamic _middleware(
  Store<AppState> store,
  SetCurrentBranch action,
  NextDispatcher next,
) {
  store.dispatch(updateActiveRoomMessages(action.room, action.branch));
  next(action);
}

final onCurrentBranchChangedMiddleware =
    TypedMiddleware<AppState, SetCurrentBranch>(_middleware);
