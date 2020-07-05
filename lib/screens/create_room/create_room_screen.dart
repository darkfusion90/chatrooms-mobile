import 'package:chatrooms/screens/create_room/widget/create_room_form.dart';
import 'package:flutter/material.dart';

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
