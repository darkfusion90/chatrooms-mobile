import 'package:chatrooms/redux/actions/public_rooms_actions/fetch_public_rooms.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:redux/redux.dart';

List<Room> _publicRoomsReducer(
  List<Room> publicRooms,
  FetchPublicRooms action,
) =>
    action.rooms;

final Reducer<List<Room>> publicRoomsReducer = combineReducers([
  TypedReducer<List<Room>, FetchPublicRooms>(_publicRoomsReducer),
]);
