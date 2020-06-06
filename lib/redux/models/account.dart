import 'package:chatrooms/redux/models/user.dart';

enum AccountType { guest, registered }

extension AccountTypeGetter on AccountType {
  bool get isRegistered => this == AccountType.registered;

  bool get isGuest => this == AccountType.guest;
}

class AccountModel {
  final UserModel user;
  final AccountType accountType;

  AccountModel(this.user, this.accountType);
}
