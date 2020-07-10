import 'package:flutter/material.dart';

import 'package:chatrooms/utils/share-util.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/widgets/appbars/appbar-interface.dart';
import 'package:chatrooms/widgets/appbars/room_appbar/room-appbar-popup-menu.dart';

class RoomAppBar extends StatefulAppBar {
  final RoomModel room;

  RoomAppBar(this.room);

  @override
  State<StatefulWidget> createState() => _RoomAppBarState();
}

class _RoomAppBarState extends State<RoomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _buildTitle(),
      actions: _buildActions(context),
    );
  }

  Widget _buildTitle() => Text(widget.room.name);

  List<Widget> _buildActions(BuildContext context) => <Widget>[
        _shareButton,
        RoomAppbarPopupMenu(),
      ];

  Widget get _shareButton => IconButton(
        icon: Icon(Icons.share),
        onPressed: () => AppShareUtils.shareRoom(widget.room),
      );
}
