import 'package:chatrooms/redux/actions/account_actions/set-user-account.dart';
import 'package:chatrooms/redux/models/account.dart';
import 'package:redux/redux.dart';

AccountModel _accountReducer(_, SetUserAccountAction action) => action.account;

final Reducer<AccountModel> accountReducer = combineReducers(
  [TypedReducer<AccountModel, SetUserAccountAction>(_accountReducer)],
);
