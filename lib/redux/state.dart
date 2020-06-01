import 'package:chatrooms/redux/models/room.dart';
import 'package:flutter/cupertino.dart';

class AppState {
  List<Room> publicRooms;

  AppState({@required this.publicRooms}) : assert(publicRooms != null);

  factory AppState.init() => AppState(publicRooms: List.unmodifiable([]));
}
