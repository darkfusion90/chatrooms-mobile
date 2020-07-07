import 'package:chatrooms/screens/create_room/create_room_screen.dart';
import 'package:chatrooms/screens/room_info/room_info_screen.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/router/route_names.dart';
import 'package:chatrooms/screens/create_account/create-account-screen.dart';
import 'package:chatrooms/screens/home/home_screen.dart';
import 'package:chatrooms/screens/room/room_screen.dart';
import 'package:chatrooms/screens/sign_in/sign_in_screen.dart';

abstract class Router {
  static MaterialPageRoute get _home =>
      MaterialPageRoute(builder: (_) => Home());

  static MaterialPageRoute get _room =>
      MaterialPageRoute(builder: (_) => Room());

  static MaterialPageRoute get _signIn =>
      MaterialPageRoute(builder: (_) => SignInScreen());

  static MaterialPageRoute get _createAccount =>
      MaterialPageRoute(builder: (_) => CreateAccountScreen());

  static MaterialPageRoute get _createRoom =>
      MaterialPageRoute(builder: (_) => CreateRoomScreen());

  static MaterialPageRoute get _roomInfo =>
      MaterialPageRoute(builder: (_) => RoomInfoScreen());

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return _home;
      case RouteNames.room:
        return _room;
      case RouteNames.createRoom:
        return _createRoom;
      case RouteNames.roomInfo:
        return _roomInfo;
      case RouteNames.signIn:
        return _signIn;
      case RouteNames.createAccount:
        return _createAccount;
      default:
        throw RouteResolveException(settings.name);
    }
  }
}

class RouteResolveException implements Exception {
  final String routeName;

  String get message => 'Could not resolve route: $routeName';

  RouteResolveException(this.routeName);
}
