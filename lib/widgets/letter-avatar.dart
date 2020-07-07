import 'package:chatrooms/utils/app_utils.dart';
import 'package:flutter/material.dart';

class LetterAvatar extends StatelessWidget {
  static const String _FALLBACK_LETTER = '#';
  final String username;
  final double size;

  const LetterAvatar({this.username, this.size = 36});

  factory LetterAvatar.small({String username}) =>
      LetterAvatar(username: username, size: 12);

  factory LetterAvatar.medium({String username}) =>
      LetterAvatar(username: username, size: 24);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Text(
          _letter,
          style: TextStyle(fontSize: size, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  String get _letter {
    if (username == null || username.isEmpty || !_isAlphanumeric) {
      return _FALLBACK_LETTER;
    }

    return username[0];
  }

  bool get _isAlphanumeric => AppUtils.isAlphanumeric(username[0]);
}
