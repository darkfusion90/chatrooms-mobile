import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppUtils {
  static const bool isProductionMode = Foundation.kReleaseMode;
  static const bool isDevMode = Foundation.kDebugMode;
}

abstract class AppDotEnv {
  static Future<dynamic> init() async => DotEnv().load();

  static String get productionHomeUrl => DotEnv().env['prod_home_url'];

  static String get developmentHomeUrl => DotEnv().env['dev_home_url'];
}
