import 'package:chatrooms/redux/models/room-message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomMessageItem extends StatelessWidget {
  final RoomMessage message;

  const RoomMessageItem({@required this.message});

  @override
  Widget build(BuildContext context) {
    if (message == null) return Container();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      color: Colors.red,
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: 0.6,
        child: Container(
          color: Colors.blue,
          child: ListTile(title: _messageAuthor, subtitle: _messageData),
        ),
      ),
    );
  }

  Widget get _messageAuthor => Text(message.author.username);

  Widget get _messageData => Text(message.data);
}
