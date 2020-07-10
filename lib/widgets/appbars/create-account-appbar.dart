import 'package:flutter/material.dart';
import 'package:chatrooms/widgets/appbars/appbar-interface.dart';

class CreateAccountAppBar extends StatelessAppBar {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('Create Account'), centerTitle: true);
  }
}
