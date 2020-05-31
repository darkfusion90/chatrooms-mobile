import 'package:chatrooms/redux/models/user.dart';

enum AccountType { guest, registered }

extension AccountTypeGetter on AccountType {
  bool get isRegistered => this == AccountType.registered;

  bool get isGuest => this == AccountType.guest;
}

class Account {
  final User user;
  final AccountType accountType;

  Account(this.user, this.accountType);
}
