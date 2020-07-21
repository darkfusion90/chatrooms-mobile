import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/router/route_names.dart';
import 'package:chatrooms/shared/enums/enum_confirmation_status.dart';

import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogManager.dart';
import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogNames.dart';
import 'package:chatrooms/widgets/dialogs/leave_room_confirmation.dart';
import 'package:chatrooms/connector_widgets/ActiveRoomConnector.dart';

enum PopupAction { leaveRoom, roomInfo }

class RoomAppbarPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActiveRoomConnector(
      builder: (_, viewModel) => _RoomAppbarPopupMenuView(
        room: viewModel.roomDetails.room,
        onLeaveRoom: viewModel.roomActions.leaveRoom,
      ),
    );
  }
}

class _RoomAppbarPopupMenuView extends StatelessWidget {
  final RoomModel room;
  final VoidCallback onLeaveRoom;

  _RoomAppbarPopupMenuView({@required this.onLeaveRoom, this.room});

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
        _handleLeaveRoom(context);
        break;
      case PopupAction.roomInfo:
        Navigator.of(context).pushNamed(RouteNames.roomInfo);
    }
  }

  void _handleLeaveRoom(BuildContext context) async {
    final ConfirmationStatus status = await DialogManager.of(context).show(
      DialogName.leaveRoomConfirmation,
      arguments: LeaveRoomConfirmationArguments(room: room),
    );

    if (status.isAccepted) {
      Navigator.of(context).pop();
      onLeaveRoom();
    }
  }
}
