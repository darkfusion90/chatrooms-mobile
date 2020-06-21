import 'package:chatrooms/redux/reducers/account_state_reducer/account_reducer.dart';
import 'package:chatrooms/redux/state/AccountState.dart';

AccountState accountStateReducer(AccountState state, dynamic action) =>
    AccountState(account: accountReducer(state.account, action));
