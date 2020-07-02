import 'package:chatrooms/redux/actions/active_room_actions/set-active-room.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:redux/redux.dart';

RoomModel _setRoom(RoomModel room, SetActiveRoomAction action) => action.room;

final Reducer<RoomModel> activeRoomReducer = combineReducers<RoomModel>([
  TypedReducer<RoomModel, SetActiveRoomAction>(_setRoom),
]);
