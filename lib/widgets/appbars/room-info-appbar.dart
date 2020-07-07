import 'package:chatrooms/widgets/room_created_at.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/widgets/appbars/appbar-interface.dart';

class RoomInfoAppBar extends BaseAppBar {
  final RoomModel room;

  RoomInfoAppBar({@required this.room}) : assert(room != null);

  @override
  State<StatefulWidget> createState() => _RoomInfoAppBar();
}

class _RoomInfoAppBar extends State<RoomInfoAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: _title(context));
  }

  Widget _title(BuildContext context) {
    final String createdBy = widget.room.createdBy.username;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.room.name,
          style: textTheme.headline6.copyWith(color: Colors.white),
        ),
        SizedBox(height: 4),
        RoomCreatedAt(
          room: widget.room,
          builder: (_, createdAt) => Text(
            'Created by: $createdBy | $createdAt',
            style: textTheme.subtitle2.copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
