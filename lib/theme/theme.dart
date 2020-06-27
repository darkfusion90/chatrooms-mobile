import 'package:flutter/material.dart';

abstract class ChatRoomsTheme {
  static ThemeData get defaultTheme => ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.purple),
      );
}
