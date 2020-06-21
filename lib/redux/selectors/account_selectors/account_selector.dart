import 'package:chatrooms/redux/models/user.dart';
import 'package:chatrooms/redux/state/AccountState.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:reselect/reselect.dart';

final Selector<AppState, AccountState> accountStateSelector =
    (AppState state) => state.accountState;

final Selector<AppState, UserModel> userSelector =
    createSelector1<AppState, AccountState, UserModel>(
  accountStateSelector,
  (AccountState state) => state.account.user,
);

final Selector<AppState, String> userIdSelector =
    createSelector1<AppState, UserModel, String>(
  userSelector,
  (UserModel user) => user?.id,
);
