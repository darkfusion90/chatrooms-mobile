import 'package:flutter/material.dart';

import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:chatrooms/router/route_names.dart';
import 'package:chatrooms/widgets/PrimaryColoredTextFlatButton.dart';
import 'package:chatrooms/widgets/account-action-form.dart';

class CreateAccountForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountConnector(
      builder: (_, viewModel) => _CreateAccountFormView(
        onCreateAccount: viewModel.register,
      ),
    );
  }
}

class _CreateAccountFormView extends StatelessWidget {
  final OnAccountActionCallback onCreateAccount;

  const _CreateAccountFormView({@required this.onCreateAccount})
      : assert(onCreateAccount != null);

  @override
  Widget build(BuildContext context) {
    return AccountActionForm(
      actionType: AccountActionType.createAccount,
      onFormSubmit: (LoginInfo info) {
        onCreateAccount(info);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.home, (route) => false);
      },
      extraAction: PrimaryColoredTextFlatButton(
        text: 'Sign In',
        onPressed: () => Navigator.of(context).pushNamed(RouteNames.signIn),
      ),
    );
  }
}
