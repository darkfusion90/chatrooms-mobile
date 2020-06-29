import 'package:chatrooms/redux/actions/account_actions/login.dart';
import 'package:chatrooms/redux/actions/account_actions/logout.dart';
import 'package:chatrooms/redux/actions/account_actions/register.dart';
import 'package:chatrooms/redux/actions/account_actions/set-user-account.dart';
import 'package:chatrooms/redux/models/account.dart';
import 'package:chatrooms/redux/selectors/account_selectors/account_selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/shared/typedefs/typedef_param_widget_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AccountConnector extends StatelessWidget {
  final ParameterizedWidgetBuilder<AccountConnectorViewModel> builder;

  const AccountConnector({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AccountConnectorViewModel>(
      converter: _viewModel,
      builder: (BuildContext context, AccountConnectorViewModel viewModel) =>
          builder(context, viewModel),
    );
  }

  AccountConnectorViewModel _viewModel(Store<AppState> store) {
    return AccountConnectorViewModel(
      account: accountSelector(store.state),
      login: (LoginInfo loginInfo) => store.dispatch(login(loginInfo)),
      logout: () => store.dispatch(logout()),
      register: (LoginInfo loginInfo) => store.dispatch(register(loginInfo)),
      updateAccount: () => store.dispatch(updateUserAccount()),
    );
  }
}

class AccountConnectorViewModel {
  final AccountModel account;
  final ValueChanged<LoginInfo> login;
  final VoidCallback logout;
  final ValueChanged<LoginInfo> register;
  final VoidCallback updateAccount;

  AccountConnectorViewModel({
    @required this.account,
    @required this.login,
    @required this.logout,
    @required this.register,
    @required this.updateAccount,
  })  : assert(account != null),
        assert(login != null),
        assert(logout != null),
        assert(register != null),
        assert(updateAccount != null);
}

class LoginInfo {
  final String username;
  final String password;

  LoginInfo(this.username, this.password);

  @override
  String toString() => 'LoginInfo(username: $username, password: $password)';
}
