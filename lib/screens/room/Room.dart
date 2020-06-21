import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/reusable_widgets/appbars/room_appbar/room-appbar.dart';
import 'package:chatrooms/screens/room/widgets/chat_view/ChatView.dart';
import 'package:chatrooms/services/socket_io/SocketService.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Room extends StatefulWidget {
  final RoomModel roomModel;

  const Room(this.roomModel);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  void initState() {
    super.initState();
    SocketService().room.joinRoom(widget.roomModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoomAppBar(widget.roomModel),
      body: ChatView(),
    );
  }
}
