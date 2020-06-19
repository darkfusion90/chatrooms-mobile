import 'package:chatrooms/connector_widgets/RoomMessagesConnector.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/models/user.dart';
import 'package:chatrooms/screens/room/widgets/room_messages_feed/RoomMessageItem.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoomMessagesConnector(
      builder: (_, RoomMessagesConnectorViewModel viewModel) => _ChatView(
        messages: viewModel.messages,
        updateMessages: viewModel.updateMessages,
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  final List<RoomMessage> messages;
  final VoidCallback updateMessages;

  const _ChatView({
    @required this.messages,
    @required this.updateMessages,
  })  : assert(messages != null),
        assert(updateMessages != null);

  @override
  Widget build(BuildContext context) {
    return DashChat(
      messages: _chatMessages,
      user: _currentUser,
      dateFormat: DateFormat('MMM dd, yyyy'),
      timeFormat: DateFormat('HH:mm'),
      inputDecoration:
          InputDecoration.collapsed(hintText: 'Write a message here...'),
      sendOnEnter: true,
      onSend: (ChatMessage message) => print('on send: ${message.text}'),
      shouldShowLoadEarlier: true,
      onLoadEarlier: updateMessages,
      showLoadEarlierWidget: _buildLoadMore,
      showInputCursor: true,
      messageBuilder: (ChatMessage message) {
        return RoomMessageItem(
            message: RoomMessage(
          id: message.id,
          roomId: '',
          author: UserModel('ss', username: 'Micheal'),
          createdAt: message.createdAt,
          data: message.text,
        ));
      },
    );
  }

  Widget _buildLoadMore() {
    return Container(
        decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
        padding: EdgeInsets.all(3),
        child: Icon(Icons.refresh, color: CupertinoColors.lightBackgroundGray));
  }

  ChatUser get _currentUser =>
      ChatUser(uid: '5e64e8a8f7a63e19e7bfc2e8', name: 'tony_stark');

  List<ChatMessage> get _chatMessages =>
      messages.map((RoomMessage msg) => msg.asChatMessage()).toList();
}
