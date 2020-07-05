import 'package:chatrooms/widgets/dialogs/join_room_dialog.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/widgets/dialogs/signout_confirmation_dialog.dart';
import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogNames.dart';

class DialogManager {
  final BuildContext context;

  DialogManager(this.context);

  factory DialogManager.of(BuildContext context) => DialogManager(context);

  Future<T> show<T>(DialogName name) {
    switch (name) {
      case DialogName.signOutConfirmation:
        return showDialog<T>(
          barrierDismissible: false,
          context: context,
          builder: _signOutConfirmation,
        );
      case DialogName.joinRoom:
        return showDialog<T>(
          context: context,
          builder: _joinRoom,
        );
      default:
        throw UnknownDialogException(name);
    }
  }

  WidgetBuilder get _signOutConfirmation => (_) => SignOutConfirmationDialog();

  WidgetBuilder get _joinRoom => (_) => JoinRoomDialog();
}

class UnknownDialogException implements Exception {
  final DialogName name;

  UnknownDialogException(this.name);

  @override
  String toString() => 'Unknown DialogName: $name';
}
