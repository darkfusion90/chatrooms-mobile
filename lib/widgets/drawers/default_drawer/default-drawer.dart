import 'package:flutter/material.dart';

import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:chatrooms/router/route_names.dart';
import 'package:chatrooms/widgets/drawers/default_drawer/items/drawer-header.dart';

import 'items/drawer-item-sign-out.dart';

class DefaultDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DefaultDrawerHeader(),
            _notification(context),
            AccountAction(),
          ],
          // Don't remove the padding.
          // The padding, for some reason, prevents the status bar from turning gray
          // Source: https://github.com/flutter/flutter/issues/13604#issuecomment-352009040
          padding: const EdgeInsets.all(0.0),
        ),
      ),
      iconColor: Theme.of(context).iconTheme.color,
    );
  }

  Widget _notification(BuildContext context) => ListTile(
        leading: Icon(Icons.notifications),
        title: Text('Notifications'),
        onTap: () => print('Notifications tap'),
      );
}

class AccountAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountConnector(
      builder: (_, viewModel) {
        return viewModel.account.isRegistered
            ? DrawerItemSignOut(onSignOut: viewModel.logout)
            : _signIn(context);
      },
    );
  }

  Widget _signIn(BuildContext context) => ListTile(
        leading: Icon(Icons.account_circle),
        title: Text('Sign In'),
        onTap: () => Navigator.of(context).popAndPushNamed(RouteNames.signIn),
      );
}
