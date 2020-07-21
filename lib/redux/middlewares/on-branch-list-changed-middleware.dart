import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/branch_actions/update-branch-list.dart';
import 'package:chatrooms/redux/actions/branch_actions/update-current-branch.dart';
import 'package:chatrooms/redux/state/AppState.dart';

dynamic _middleware(
  Store<AppState> store,
  SetBranchList action,
  NextDispatcher next,
) {
  store.dispatch(initializeCurrentBranch(action));
  next(action);
}

final onBranchListChangedMiddleware =
    TypedMiddleware<AppState, SetBranchList>(_middleware);
