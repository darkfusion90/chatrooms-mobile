import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:chatrooms/redux/models/account.dart';
import 'package:chatrooms/redux/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';

import 'package:chatrooms/connector_widgets/RoomMessagesConnector.dart';
import 'package:chatrooms/redux/models/room-message.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountConnector(
      builder: (_, AccountModel account) => RoomMessagesConnector(
        builder: (_, RoomMessagesConnectorViewModel viewModel) => _ChatView(
          currentUser: account.user,
          messages: viewModel.messages,
          updateMessages: viewModel.updateMessages,
          sendMessage: viewModel.sendMessage,
        ),
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  final UserModel currentUser;
  final List<RoomMessage> messages;
  final VoidCallback updateMessages;
  final ValueChanged<String> sendMessage;

  _ChatView({
    @required this.currentUser,
    @required this.messages,
    @required this.updateMessages,
    @required this.sendMessage,
  })  : assert(messages != null),
        assert(updateMessages != null);

  @override
  Widget build(BuildContext context) {
    return DashChat(
      messages: messages.map((RoomMessage e) => fromRoomMessage(e)).toList(),
      user: fromUser(currentUser),
      dateFormat: DateFormat('MMM dd, yyyy'),
      timeFormat: DateFormat('HH:mm'),
      inputDecoration:
          InputDecoration.collapsed(hintText: 'Write a message here...'),
      sendOnEnter: true,
      onSend: (ChatMessage message) {
        print('on send: ${message.text}');
        sendMessage(message.text);
      },
      shouldShowLoadEarlier: true,
      onLoadEarlier: updateMessages,
      showLoadEarlierWidget: _buildLoadMore,
      showInputCursor: true,
      chatFooterBuilder: () => _buildChatFooter(context),
    );
  }

  Widget _buildLoadMore() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      padding: EdgeInsets.all(3),
      child: Icon(Icons.refresh, color: CupertinoColors.lightBackgroundGray),
    );
  }

  Widget _buildChatFooter(BuildContext context) {
    return messages.isEmpty ? _buildNoMessagesInfo(context) : Container();
  }

  Widget _buildNoMessagesInfo(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        color: Theme.of(context).accentColor,
        alignment: Alignment.center,
        child: Text(
          "This room doesn't have any messages yet",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

ChatUser fromUser(UserModel user) {
  return ChatUser(uid: user.id, name: user.username);
}

ChatMessage fromRoomMessage(RoomMessage message) {
  return ChatMessage(
    id: message.id,
    text: message.data,
    user: fromUser(message.author),
    createdAt: message.createdAt,
  );
}
