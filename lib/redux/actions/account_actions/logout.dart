import 'package:chatrooms/redux/actions/account_actions/set-user-account.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> logout() {
  return (Store<AppState> store) async {
    await Api.user.logout();
    store.dispatch(updateUserAccount());
  };
}
