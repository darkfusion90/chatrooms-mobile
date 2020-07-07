import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppUtils {
  static const bool isProductionMode = Foundation.kReleaseMode;
  static const bool isDevMode = Foundation.kDebugMode;

  static bool isAlphanumeric(String str) {
    bool _alphanumericTest(int codeUnit) {
      final double _codeUnit = codeUnit.toDouble();
      final Range digits = Range(48, 57);
      final Range uppercase = Range(65, 90);
      final Range lowercase = Range(97, 122);

      return digits.contains(_codeUnit) ||
          uppercase.contains(_codeUnit) ||
          lowercase.contains(_codeUnit);
    }

    bool isAlphanumeric = false;
    str.runes.forEach(
      (int codePoint) => isAlphanumeric = _alphanumericTest(codePoint),
    );

    return isAlphanumeric;
  }
}

abstract class AppDotEnv {
  static Future<dynamic> init() async => DotEnv().load();

  static String get productionHomeUrl => DotEnv().env['prod_home_url'];

  static String get developmentHomeUrl => DotEnv().env['dev_home_url'];
}

class Range {
  final double from;
  final double to;

  Range(this.from, this.to);

  bool contains(double val) => val >= from && val <= to;
}
