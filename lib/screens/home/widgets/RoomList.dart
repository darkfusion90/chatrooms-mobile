import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

class RoomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Room>>(
      converter: (store) => store.state.publicRooms,
      builder: (_, List<Room> publicRooms) => _RoomListView(publicRooms),
    );
  }
}

class _RoomListView extends StatelessWidget {
  final List<Room> publicRooms;

  _RoomListView(this.publicRooms);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: publicRooms.length,
      itemBuilder: (_, int index) => _RoomListItem(publicRooms[index]),
      separatorBuilder: (_, __) => Divider(),
    );
  }
}

class _RoomListItem extends StatelessWidget {
  final Room room;
  final DateFormat _createdAtDateFormatter = DateFormat('dd/MM/yyyy HH:mm');

  _RoomListItem(this.room);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(room.name),
      subtitle: _buildSubtitle(),
      trailing: _buildJoinRoomButton(),
    );
  }

  Widget _buildSubtitle() {
    final String createdAt = _createdAtDateFormatter.format(room.createdAt);

    return Text('Created: $createdAt');
  }

  Widget _buildJoinRoomButton() {
    return RaisedButton(
      child: Text('Join'),
      onPressed: () => print('Requesting to join: ${room.name}'),
    );
  }
}
