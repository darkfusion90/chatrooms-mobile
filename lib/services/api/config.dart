import 'package:chatrooms/utils/app_utils.dart';

class ApiConfig {
  static String get rootUrl => AppUtils.isDevMode
      ? AppDotEnv.developmentApiUrl
      : AppDotEnv.productionApiUrl;

  static String createUrl(String otherPart) => '$rootUrl/$otherPart';
}
