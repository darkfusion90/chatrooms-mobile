import 'package:flutter/material.dart';

abstract class ChatRoomsTheme {
  static ThemeData get defaultTheme => ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.orange,
        backgroundColor: Colors.orangeAccent,
        iconTheme: IconThemeData(color: Colors.purple),
      );
}
