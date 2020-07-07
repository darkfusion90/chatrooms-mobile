import 'package:flutter/material.dart';

import 'package:chatrooms/router/route_names.dart';
import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogManager.dart';
import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogNames.dart';

class HomeAppbarMenuButton extends StatelessWidget {
  final List<PopupMenuEntry<PopupEntryAction>> _popupMenuEntries = [
    PopupMenuItem<PopupEntryAction>(
      value: PopupEntryAction.createRoom,
      child: Text('Create Room'),
    ),
    PopupMenuDivider(),
    PopupMenuItem<PopupEntryAction>(
      value: PopupEntryAction.joinRoom,
      child: Text('Join Room'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupEntryAction>(
      itemBuilder: (_) => _popupMenuEntries,
      onSelected: (action) => _onPopupEntrySelected(context, action),
    );
  }

  void _onPopupEntrySelected(BuildContext context, PopupEntryAction action) {
    switch (action) {
      case PopupEntryAction.createRoom:
        Navigator.of(context).pushNamed(RouteNames.createRoom);
        break;
      case PopupEntryAction.joinRoom:
        DialogManager.of(context).show(DialogName.joinRoom);
        break;
    }
  }
}

enum PopupEntryAction { createRoom, joinRoom }
