import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/widgets/appbars/appbar-interface.dart';
import 'package:chatrooms/widgets/appbars/room_appbar/room-appbar-popup-menu.dart';
import 'package:chatrooms/widgets/appbars/room_appbar/branch_action_popup/branch-action-popup-button.dart';

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
        RoomAppBarBranchAction(),
        RoomAppbarPopupMenu(),
      ];
}
