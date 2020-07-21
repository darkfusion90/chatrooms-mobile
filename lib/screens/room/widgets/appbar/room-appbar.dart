import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/room.dart';

import 'package:chatrooms/widgets/appbars/appbar-interface.dart';
import 'package:chatrooms/screens/room/widgets/appbar/room-appbar-popup-menu.dart';
import 'package:chatrooms/screens/room/widgets/appbar/branch_action_popup/branch-action-popup-button.dart';

class RoomAppBar extends StatefulAppBar {
  final RoomModel room;

  RoomAppBar(this.room);

  @override
  State<StatefulWidget> createState() => _RoomAppBarState();
}

class _RoomAppBarState extends State<RoomAppBar> {
  String get _roomName => widget.room.name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _buildTitle(),
      actions: _buildActions(context),
    );
  }

  // For room names longer than which can fit in the title, we show tooltip on long press
  Widget _buildTitle() => Tooltip(
        child: Text(_roomName),
        message: '$_roomName',
      );

  List<Widget> _buildActions(BuildContext context) => <Widget>[
        RoomAppBarBranchAction(),
        RoomAppbarPopupMenu(),
      ];
}
