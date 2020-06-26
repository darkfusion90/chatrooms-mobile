import 'package:chatrooms/connector_widgets/ActiveRoomConnector.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/reusable_widgets/appbars/room_appbar/room-appbar.dart';
import 'package:chatrooms/screens/room/widgets/chat_view/ChatView.dart';
import 'package:chatrooms/services/socket_io/SocketService.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Room extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActiveRoomConnector(
      builder: (_, ActiveRoomViewModel viewModel) => _RoomView(
        room: viewModel.room,
        resetActiveRoom: viewModel.resetActiveRoom,
      ),
    );
  }
}

class _RoomView extends StatefulWidget {
  final RoomModel room;
  final VoidCallback resetActiveRoom;

  const _RoomView({
    @required this.room,
    @required this.resetActiveRoom,
  });

  @override
  __RoomViewState createState() => __RoomViewState();
}

class __RoomViewState extends State<_RoomView> {
  @override
  void initState() {
    super.initState();
    _joinRoom();
  }

  @override
  void didUpdateWidget(_RoomView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.room != widget.room) {
      _joinRoom();
    }
  }

  @override
  void dispose() {
    widget.resetActiveRoom();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoomAppBar(widget.room),
      body: ChatView(),
    );
  }

  void _joinRoom() => SocketService().room.joinRoom(widget.room?.id);
}
