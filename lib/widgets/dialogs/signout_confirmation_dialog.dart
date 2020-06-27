import 'package:chatrooms/widgets/dialogs/confirmation_dialog.dart';
import 'package:flutter/material.dart';

class SignOutConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: Text('Confirm Sign Out'),
      content: Text('Are you sure you want to sign out?'),
      acceptText: 'Sign Out',
    );
  }
}
