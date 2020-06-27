import 'package:chatrooms/app/app.dart' show ChatRoomsApp;
import 'package:chatrooms/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  await AppDotEnv.init();
  runApp(ChatRoomsApp());
}
