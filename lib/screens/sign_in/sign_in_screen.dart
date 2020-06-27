import 'package:flutter/material.dart';

import 'package:chatrooms/screens/sign_in/widgets/sign_in_form.dart';
import 'package:chatrooms/widgets/appbars/sign-in-appbar.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignInAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 120.0),
        child: SignInForm(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
