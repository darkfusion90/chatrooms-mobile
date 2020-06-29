import 'package:flutter/material.dart';
import 'package:chatrooms/widgets/appbars/appbar-interface.dart';

class CreateAccountAppBar extends BaseAppBar {
  @override
  State<StatefulWidget> createState() => _CreateAccountAppBarState();
}

class _CreateAccountAppBarState extends State<CreateAccountAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('Create Account'), centerTitle: true);
  }
}
