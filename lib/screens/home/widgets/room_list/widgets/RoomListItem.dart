import 'package:chatrooms/widgets/room_created_at.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/connector_widgets/ActiveRoomConnector.dart';
import 'package:chatrooms/router/route_names.dart';

import 'RoomListItemActions.dart';

class RoomListItem extends StatelessWidget {
  final RoomModel room;

  RoomListItem(this.room);

  @override
  Widget build(BuildContext context) {
    return ActiveRoomConnector(
      builder: (_, viewModel) => _RoomListItemView(
        room: room,
        setActiveRoom: () => viewModel.setActiveRoom(room),
      ),
    );
  }
}

class _RoomListItemView extends StatelessWidget {
  final RoomModel room;
  final VoidCallback setActiveRoom;

  _RoomListItemView({@required this.room, @required this.setActiveRoom})
      : assert(room != null),
        assert(setActiveRoom != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(room.name),
      subtitle: _subtitle,
      isThreeLine: true,
      trailing: RoomListItemActions(room: room),
      onTap: () => _handleOnItemTap(context),
    );
  }

  Widget get _subtitle {
    final String createdBy = room.createdBy.username;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.edit,
              size: 16,
            ),
            SizedBox(width: 3),
            Text(createdBy ?? '...'),
          ],
        ),
        SizedBox(height: 10),
        RoomCreatedAt(room: room),
      ],
    );
  }
  
  void _handleOnItemTap(BuildContext context) {
    setActiveRoom();
    Navigator.of(context).pushNamed(RouteNames.room);
  }
}
