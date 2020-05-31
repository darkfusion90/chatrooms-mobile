import 'package:flutter/cupertino.dart';

class User {
  final String id;
  String username;

  User(this.id, {@required this.username}) : assert(username != null);
}
