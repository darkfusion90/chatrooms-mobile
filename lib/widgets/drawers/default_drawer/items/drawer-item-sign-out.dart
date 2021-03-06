import 'package:chatrooms/router/redirections.dart';
import 'package:chatrooms/shared/enums/enum_confirmation_status.dart';
import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogManager.dart';
import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogNames.dart';
import 'package:flutter/material.dart';

class DrawerItemSignOut extends StatelessWidget {
  final VoidCallback onSignOut;

  const DrawerItemSignOut({@required this.onSignOut})
      : assert(onSignOut != null);

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

    if (status.isAccepted) {
      onSignOut();
      CompleteRedirect.of(context).toHome();
    }
  }
}
