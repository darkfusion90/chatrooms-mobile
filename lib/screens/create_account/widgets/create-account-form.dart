import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:chatrooms/router/route_names.dart';
import 'package:chatrooms/widgets/PrimaryColoredTextFlatButton.dart';
import 'package:chatrooms/widgets/account-action-form.dart';
import 'package:flutter/material.dart';

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
      onFormSubmit: onCreateAccount,
      extraAction: PrimaryColoredTextFlatButton(
        text: 'Sign In',
        onPressed: () => Navigator.of(context).pushNamed(RouteNames.signIn),
      ),
    );
  }
}
