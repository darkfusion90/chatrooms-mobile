import 'package:chatrooms/redux/models/account.dart';
import 'package:chatrooms/redux/state/state_interface.dart';
import 'package:flutter/cupertino.dart';

class AccountState extends ReduxState {
  AccountModel account;

  AccountState({@required this.account}) : assert(account != null);

  factory AccountState.init() =>
      AccountState(account: AccountModel(null, null));

  @override
  String toString() => 'AccountState(account: $account)';

  @override
  bool compareState(other) => other is AccountState && other.account == account;

  @override
  int getHashCode() => account.hashCode;
}
