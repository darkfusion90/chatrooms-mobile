import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:chatrooms/redux/actions/account_actions/set-user-account.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:requests/requests.dart';

ThunkAction<AppState> login(LoginInfo info) {
  return (Store<AppState> store) async {
    print('username: ${info.username}, password: ${info.password}');
    final Response response = await Api.user.login(info);

    print('Response: ${response.statusCode}\n${response.json()}');
    store.dispatch(updateUserAccount());
  };
}
