import 'package:chatrooms/screens/create_account/widgets/create-account-form.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/widgets/appbars/create-account-appbar.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateAccountAppBar(),
      body: CreateAccountForm(),
      resizeToAvoidBottomPadding: false,
    );
  }
}
