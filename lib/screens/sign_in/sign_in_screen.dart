import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/account.dart';
import 'package:chatrooms/screens/sign_in/widgets/sign_in_form.dart';
import 'package:chatrooms/widgets/appbars/sign-in-appbar.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountConnector(
      builder: (_, viewModel) => _SignInScreenView(account: viewModel.account),
    );
  }
}

class _SignInScreenView extends StatefulWidget {
  final AccountModel account;

  const _SignInScreenView({@required this.account}) : assert(account != null);

  @override
  _SignInScreenViewState createState() => _SignInScreenViewState();
}

class _SignInScreenViewState extends State<_SignInScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignInAppBar(),
      body: SignInForm(),
      resizeToAvoidBottomPadding: false,
    );
  }
}
