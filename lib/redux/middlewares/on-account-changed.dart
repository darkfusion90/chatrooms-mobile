import 'package:chatrooms/redux/actions/account_actions/set-user-account.dart';
import 'package:chatrooms/redux/actions/membership_actions/update_room_memberships.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:redux/redux.dart';


dynamic _middleware(
  Store<AppState> store,
  SetUserAccountAction action,
  NextDispatcher next,
) {
  print('SetUserAccountAction detected. Account: ${action.account}');
  store.dispatch(updateRoomMemberships(action.account));
  next(action);
}

final onAccountChangedMiddleware =
    TypedMiddleware<AppState, SetUserAccountAction>(_middleware);
