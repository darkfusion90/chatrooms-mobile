import 'package:chatrooms/utils/url-provider.dart';

class ApiConfig {
  static String get rootUrl => UrlProvider.apiRootUrl;

  static String createUrl(String otherPart) => '$rootUrl/$otherPart';
}
