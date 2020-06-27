import 'package:requests/requests.dart';

import 'package:chatrooms/redux/models/account.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:chatrooms/services/api/config.dart';

class ApiUser {
  static final String _root = ApiConfig.createUrl('user');
  static final String _loginRoot = ApiConfig.createUrl('login');
  static final String _logoutRoot = ApiConfig.createUrl('logout');
  static final String _registerRoot = ApiConfig.createUrl('registered');

  Future<AccountModel> getCurrentUserAccount() async {
    return AccountModel.fromJson(await Api.getJson(_root));
  }

  Future<Response> login(String username, String password) {
    return Requests.post(
      _loginRoot,
      body: {'username': username, 'password': password},
    );
  }

  Future<Response> logout() => Requests.post(_logoutRoot);

  Future<Response> register() => Requests.get(_registerRoot);
}
