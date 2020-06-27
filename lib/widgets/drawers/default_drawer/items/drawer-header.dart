import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:chatrooms/redux/models/account.dart';
import 'package:chatrooms/utils/AssetsProvider.dart';
import 'package:chatrooms/widgets/letter-avatar.dart';
import 'package:flutter/material.dart';

class DefaultDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountConnector(
      builder: (_, viewModel) => _DefaultDrawerHeaderView(
        account: viewModel.account,
      ),
    );
  }
}

class _DefaultDrawerHeaderView extends StatelessWidget {
  final AccountModel account;

  const _DefaultDrawerHeaderView({@required this.account});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(_effectiveUsername),
      accountEmail: null,
      currentAccountPicture: GestureDetector(
        child: _avatar,
        onTap: () => print('avatar on click'),
      ),
    );
  }

  String get _effectiveUsername {
    if (account.isRegistered) return account.user.username;
    print('username: ${account.user.username}');
    return 'Guest-${account.user.username}';
  }

  Widget get _avatar {
    if (account.isRegistered)
      return LetterAvatar(username: account.user.username);

    return CircleAvatar(
      backgroundImage: AssetImage(AssetKeyProvider.guestAccountAvatar),
      backgroundColor: Colors.transparent,
      onBackgroundImageError: (error, stackTrace) =>
          print('Error loading guest avatar: $error\nStackTrace: $stackTrace'),
    );
  }
}
