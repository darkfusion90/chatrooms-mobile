import 'package:chatrooms/connector_widgets/ActiveRoomConnector.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/screens/room/widgets/modes/room_mode_member.dart';
import 'package:chatrooms/screens/room/widgets/modes/room_mode_not_member.dart';
import 'package:chatrooms/widgets/appbars/room_appbar/room-appbar.dart';
import 'package:chatrooms/screens/room/widgets/chat_view/ChatView.dart';
import 'package:chatrooms/services/socket_io/SocketService.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

class _RoomView extends StatelessWidget {
  final RoomModel room;
  final VoidCallback resetActiveRoom;

  const _RoomView({
    @required this.room,
    @required this.resetActiveRoom,
  });

  @override
  Widget build(BuildContext context) {
    if (room == null || room.isMembershipUndetermined) {
      return _loadingIndicator();
    }

    return room.isMember ? RoomModeViewMember() : RoomModeViewNonMember();
  }

  Widget _loadingIndicator() {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitChasingDots(color: Colors.orange),
          SizedBox(height: 10),
          Text('Loading', style: TextStyle(fontSize: 26, color: Colors.grey)),
        ],
      ),
    );
  }
}
