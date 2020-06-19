import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/reusable_widgets/appbars/room_appbar/room-appbar.dart';
import 'package:chatrooms/screens/room/widgets/chat_view/ChatView.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Room extends StatelessWidget {
  final RoomModel roomModel;

  const Room(this.roomModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoomAppBar(roomModel),
      body: ChatView(),
    );
  }
}