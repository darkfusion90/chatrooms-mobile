RegExp safeRegex(
  String source, {
  bool multiLine,
  bool caseSensitive,
}) =>
    RegExp(
      RegExp.escape(source),
      caseSensitive: caseSensitive,
      multiLine: multiLine,
    );
