import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:requests/requests.dart';

import 'package:chatrooms/redux/models/account.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:chatrooms/services/api/config.dart';

class ApiUser {
  static final String _root = ApiConfig.createUrl('user');
  static final String _loginRoot = ApiConfig.createUrl('login');
  static final String _logoutRoot = ApiConfig.createUrl('logout');
  static final String _registerRoot = _root;

  Future<AccountModel> getCurrentUserAccount() async {
    return AccountModel.fromJson(await Api.getJson(_root));
  }

  Future<Response> login(LoginInfo info) => _postAccount(_loginRoot, info);

  Future<Response> logout() => Requests.post(_logoutRoot);

  Future<Response> register(LoginInfo info) =>
      _postAccount(_registerRoot, info);

  Future<Response> _postAccount(String url, LoginInfo info) =>
      Requests.post(url, body: {
        'username': info.username,
        'password': info.password,
      });
}
