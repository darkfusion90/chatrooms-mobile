import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:chatrooms/redux/actions/account_actions/set-user-account.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:requests/requests.dart';

ThunkAction<AppState> register(LoginInfo info) {
  return (Store<AppState> store) async {
    Response response = await Api.user.register(info);
    print('Register status: ${response.statusCode}, json: ${response.json()}');
    Response loginRsp = await Api.user.login(info);
    print('Register status: ${loginRsp.statusCode}, json: ${loginRsp.json()}');
    store.dispatch(updateUserAccount());
  };
}
