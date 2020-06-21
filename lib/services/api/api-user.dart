import 'package:chatrooms/redux/models/account.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:chatrooms/services/api/config.dart';

class ApiUser {
  static final String _root = ApiConfig.createUrl('user');

  Future<AccountModel> getCurrentUserAccount() async {
    return AccountModel.fromJson(await Api.getJson(_root));
  }
}
