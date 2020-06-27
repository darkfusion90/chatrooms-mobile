import 'package:flutter/material.dart';
import 'package:chatrooms/widgets/appbars/appbar-interface.dart';

class SignInAppBar extends BaseAppBar {
  @override
  State<StatefulWidget> createState() => _SignInAppBarState();
}

class _SignInAppBarState extends State<SignInAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('Sign In'), centerTitle: true);
  }
}
