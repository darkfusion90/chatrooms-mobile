import 'package:chatrooms/redux/models/account.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class SetUserAccountAction {
  final AccountModel account;

  SetUserAccountAction(this.account);
}

ThunkAction<AppState> updateUserAccount() => (Store<AppState> store) async {
      final AccountModel account = await Api.user.getCurrentUserAccount();
      store.dispatch(SetUserAccountAction(account));
    };
