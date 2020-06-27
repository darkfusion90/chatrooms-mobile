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
      default:
        throw UnknownDialogException(name);
    }
  }

  WidgetBuilder get _signOutConfirmation => (_) => SignOutConfirmationDialog();
}

class UnknownDialogException implements Exception {
  final DialogName name;

  UnknownDialogException(this.name);

  @override
  String toString() => 'Unknown DialogName: $name';
}
