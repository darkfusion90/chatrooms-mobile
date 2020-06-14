import 'package:chatrooms/utils/url-provider.dart';

class ApiConfig {
  static String get rootUrl => UrlProvider.rootUrl;

  static String createUrl(String otherPart) => '$rootUrl/$otherPart';
}
