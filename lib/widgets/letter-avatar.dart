import 'package:flutter/material.dart';

class LetterAvatar extends StatelessWidget {
  static const String _FALLBACK_LETTER = '#';
  final String username;

  const LetterAvatar({this.username});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Text(
          _letter,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  String get _letter {
    if (username == null || username.isEmpty) {
      return _FALLBACK_LETTER;
    }

    return username[0];
  }
}
