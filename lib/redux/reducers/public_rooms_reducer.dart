import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state.dart';
import 'package:redux/redux.dart';

List<Room> _publicRoomsReducer(List<Room> publicRooms, dynamic action) =>
    publicRooms;

final Reducer<List<Room>> publicRoomsReducer =
    TypedReducer<List<Room>, dynamic>(publicRoomsReducer);
