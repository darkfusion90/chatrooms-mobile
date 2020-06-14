import 'package:chatrooms/redux/models/room-membership.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/screens/room/Room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoomListItem extends StatelessWidget {
  final RoomModel room;
  final DateFormat _createdAtDateFormatter = DateFormat('MMM d, yyyy');

  RoomListItem(this.room);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(room.name),
      subtitle: _buildSubtitle(),
      trailing: _buildJoinRoomButton(context),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => Room(room)),
      ),
    );
  }

  Widget _buildSubtitle() {
    final String createdAt = _createdAtDateFormatter.format(room.createdAt);

    return Text('Created: $createdAt');
  }

  Widget _buildJoinRoomButton(BuildContext context) {
    return OutlineButton(
      child: Text(
        room.membership.isUndetermined
            ? 'Undetermined'
            : (room.membership.isMember ? 'Member' : 'Not Member'),
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      onPressed: () => print('Requesting to join: ${room.name}'),
    );
  }
}
