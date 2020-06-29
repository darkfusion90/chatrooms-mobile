import 'package:chatrooms/widgets/PrimaryColoredTextFlatButton.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:chatrooms/redux/actions/account_actions/login.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/router/route_names.dart';
import 'package:chatrooms/widgets/account-action-form.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnAccountActionCallback>(
      converter: _signInCallback,
      builder: (_, signIn) => _SignInForm(onSignIn: signIn),
    );
  }

  OnAccountActionCallback _signInCallback(Store<AppState> store) {
    return (LoginInfo info) => store.dispatch(login(info));
  }
}

class _SignInForm extends StatelessWidget {
  final ValueChanged<LoginInfo> onSignIn;

  _SignInForm({@required this.onSignIn}) : assert(onSignIn != null);

  @override
  Widget build(BuildContext context) {
    return AccountActionForm(
      onFormSubmit: onSignIn,
      actionType: AccountActionType.login,
      extraAction: _createAccountButton(context),
    );
  }

  Widget _createAccountButton(BuildContext context) =>
      PrimaryColoredTextFlatButton(
        text: 'Create Account',
        onPressed: () =>
            Navigator.of(context).pushNamed(RouteNames.createAccount),
      );
}
