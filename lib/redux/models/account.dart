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

  bool get isRegistered => accountType.isRegistered;

  bool get isGuest => accountType.isGuest;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        UserModel.fromJson(_assembleUserJson(json)),
        _parseAccountType(json['isRegistered']),
      );

  static Map<String, dynamic> _assembleUserJson(Map<String, dynamic> json) {
    return {'_id': json['_id'], 'username': json['username']};
  }

  static AccountType _parseAccountType(dynamic isRegistered) {
    return isRegistered ? AccountType.registered : AccountType.guest;
  }

  @override
  bool operator ==(other) =>
      other is AccountModel &&
      other.user == user &&
      other.accountType == accountType;

  @override
  int get hashCode => user.hashCode ^ accountType.hashCode;

  @override
  String toString() =>
      'AccountModel(user: $user,\naccountType: $accountType\n)';
}
