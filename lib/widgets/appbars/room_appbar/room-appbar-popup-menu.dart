import 'package:flutter/material.dart';

import 'package:chatrooms/connector_widgets/ActiveRoomConnector.dart';
import 'package:chatrooms/router/route_names.dart';

enum PopupAction { leaveRoom, roomInfo }

class RoomAppbarPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActiveRoomConnector(
      builder: (_, viewModel) => _RoomAppbarPopupMenuView(
        onLeaveRoom: viewModel.roomActions.leaveRoom,
      ),
    );
  }
}

class _RoomAppbarPopupMenuView extends StatelessWidget {
  final VoidCallback onLeaveRoom;

  _RoomAppbarPopupMenuView({@required this.onLeaveRoom});

  final List<PopupMenuEntry<PopupAction>> _popupItems = [
    PopupMenuItem(
      value: PopupAction.leaveRoom,
      child: Text('Leave Room'),
    ),
    PopupMenuItem(
      value: PopupAction.roomInfo,
      child: Text('Room Info'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupAction>(
      itemBuilder: (_) => _popupItems,
      offset: Offset(0, 32.0),
      onSelected: (action) => _onPopupItemSelected(context, action),
    );
  }

  void _onPopupItemSelected(BuildContext context, PopupAction action) {
    switch (action) {
      case PopupAction.leaveRoom:
        onLeaveRoom();
        Navigator.of(context).pop();
        break;
      case PopupAction.roomInfo:
        Navigator.of(context).pushNamed(RouteNames.roomInfo);
    }
  }
}
