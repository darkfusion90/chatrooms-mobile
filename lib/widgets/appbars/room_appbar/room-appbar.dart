import 'package:chatrooms/widgets/appbars/room_appbar/room-appbar-popup-menu.dart';
import 'package:chatrooms/utils/share-util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/widgets/appbars/appbar-interface.dart';

class RoomAppBar extends BaseAppBar {
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
      actions: _buildActions(),
    );
  }

  Widget _buildTitle() => Text(widget.room.name);

  List<Widget> _buildActions() => <Widget>[
        _buildShareButton(),
        RoomAppbarPopupMenu(),
      ];

  Widget _buildShareButton() => IconButton(
        icon: Icon(Icons.share),
        onPressed: () => AppShareUtils.shareRoom(widget.room),
      );
}
