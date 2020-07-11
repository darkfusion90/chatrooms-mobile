import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/user.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/router/route_names.dart';
import 'package:chatrooms/widgets/room_created_at.dart';
import 'package:chatrooms/connector_widgets/ActiveRoomConnector.dart';
import 'package:chatrooms/screens/home/widgets/room_feed/widgets/room_feed_item_actions.dart';

class RoomFeedItem extends StatelessWidget {
  final RoomModel room;
  final double paddingTop;

  const RoomFeedItem({this.room, this.paddingTop});

  @override
  Widget build(BuildContext context) {
    return ActiveRoomConnector(
      builder: (_, viewModel) => _RoomListItemView(
        paddingTop: paddingTop,
        room: room,
        setActiveRoom: () => viewModel.setActiveRoom(room),
      ),
    );
  }
}

class _RoomListItemView extends StatelessWidget {
  final double paddingTop;
  final RoomModel room;
  final VoidCallback setActiveRoom;

  const _RoomListItemView({
    @required this.room,
    @required this.setActiveRoom,
    this.paddingTop,
  })  : assert(room != null),
        assert(setActiveRoom != null);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets contentPadding = EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12,
    ).copyWith(top: paddingTop);

    return ListTile(
      title: Text(room.name),
      subtitle: _subtitle,
      isThreeLine: true,
      trailing: RoomListItemActions(room: room),
      contentPadding: contentPadding,
      onTap: () => _handleOnItemTap(context),
    );
  }

  Widget get _subtitle => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _roomCreatedBy,
          SizedBox(height: 10),
          RoomCreatedAt(room: room),
        ],
      );

  Widget get _roomCreatedBy {
    String createdBy = room.createdBy.username ?? UserModel.deleted.username;

    return Row(
      children: <Widget>[
        Icon(Icons.edit, size: 16),
        SizedBox(width: 3),
        Text(createdBy ?? '...'),
      ],
    );
  }

  void _handleOnItemTap(BuildContext context) {
    setActiveRoom();
    Navigator.of(context).pushNamed(RouteNames.room);
  }
}
