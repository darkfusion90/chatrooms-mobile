import 'package:chatrooms/redux/models/room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoomListItem extends StatelessWidget {
  final Room room;
  final DateFormat _createdAtDateFormatter = DateFormat('MMM d, yyyy');

  RoomListItem(this.room);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(room.name),
      subtitle: _buildSubtitle(),
      trailing: _buildJoinRoomButton(context),
    );
  }

  Widget _buildSubtitle() {
    final String createdAt = _createdAtDateFormatter.format(room.createdAt);

    return Text('Created: $createdAt');
  }

  Widget _buildJoinRoomButton(BuildContext context) {
    return OutlineButton(
      child: Text(
        'Join',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      onPressed: () => print('Requesting to join: ${room.name}'),
    );
  }
}
