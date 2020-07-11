import 'package:chatrooms/connector_widgets/RoomMessagesConnector.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/services/socket_io/SocketService.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/screens/room/widgets/chat_view/ChatView.dart';

class RoomModeViewMember extends StatelessWidget {
  final RoomModel room;

  RoomModeViewMember({@required this.room}) : assert(room != null) {
    assert(
      room.isMember,
      'User must be a member of the room to access this view-mode',
    );
  }

  @override
  Widget build(BuildContext context) => ActiveRoomMessagesConnector(
        builder: (_, viewModel) => _RoomModeViewMember(
          room: room,
          onUpdateMessages: viewModel.updateMessages,
        ),
      );
}

class _RoomModeViewMember extends StatefulWidget {
  final RoomModel room;
  final VoidCallback onUpdateMessages;

  const _RoomModeViewMember({
    @required this.onUpdateMessages,
    @required this.room,
  });

  @override
  _RoomModeViewMemberState createState() => _RoomModeViewMemberState();
}

class _RoomModeViewMemberState extends State<_RoomModeViewMember> {
  @override
  void initState() {
    super.initState();
    SocketService().room.joinRoom(widget.room.id);
    SocketService().onNewMessage((_) => widget.onUpdateMessages());
  }

  @override
  Widget build(BuildContext context) => ChatView();
}
