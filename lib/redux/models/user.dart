import 'package:flutter/cupertino.dart';

class UserModel {
  final String id;
  String username;

  UserModel(this.id, {@required this.username}) : assert(username != null);
}
