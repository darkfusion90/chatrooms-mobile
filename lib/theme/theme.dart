import 'package:flutter/material.dart';

abstract class ChatRoomsTheme {
  static ThemeData get defaultTheme => ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.deepOrange,
        backgroundColor: Colors.orangeAccent,
        dividerColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.purple),
      );
}
