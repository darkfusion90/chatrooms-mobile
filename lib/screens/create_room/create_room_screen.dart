import 'package:flutter/material.dart';

import 'package:chatrooms/screens/create_room/widgets/create_room_form/create_room_form.dart';

class CreateRoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Room')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(child: CreateRoomForm()),
      ),
    );
  }
}
