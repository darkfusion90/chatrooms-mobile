import 'package:chatrooms/widgets/dialogs/confirmation_dialog.dart';
import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogManager.dart';
import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogNames.dart';
import 'package:flutter/material.dart';

class DrawerItemSignOut extends StatefulWidget {
  final VoidCallback onSignOut;

  const DrawerItemSignOut({@required this.onSignOut})
      : assert(onSignOut != null);

  @override
  _DrawerItemSignOutState createState() => _DrawerItemSignOutState();
}

class _DrawerItemSignOutState extends State<DrawerItemSignOut> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('Sign Out'),
      onTap: () => _confirmSignOut(context),
    );
  }

  void _confirmSignOut(BuildContext context) async {
    ConfirmationStatus status =
        await DialogManager.of(context).show(DialogName.signOutConfirmation);

    if (status.isAccepted) widget.onSignOut();
  }
}
