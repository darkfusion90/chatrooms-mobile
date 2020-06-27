import 'package:chatrooms/widgets/appbars/default-appbar.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatRoomsAppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Text('Create Account Screen'),
      ),
    );
  }
}
