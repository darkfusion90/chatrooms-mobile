import 'package:chatrooms/App.dart';
import 'package:chatrooms/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  await AppDotEnv.init();
  runApp(ChatRoomsApp());
}
