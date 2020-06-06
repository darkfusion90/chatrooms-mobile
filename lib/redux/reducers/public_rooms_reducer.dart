import 'package:chatrooms/redux/actions/public_rooms_actions/fetch_public_rooms.dart';
import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/selectors/rooms_selectors.dart';
import 'package:chatrooms/redux/state/RoomsState.dart';
import 'package:redux/redux.dart';

RoomListModel _fetchPublicRoomsReducer(
  RoomListModel roomList,
  FetchPublicRooms action,
) =>
    RoomListModel(action.rooms);

final Reducer<RoomListModel> _roomListReducer = combineReducers([
  TypedReducer<RoomListModel, FetchPublicRooms>(_fetchPublicRoomsReducer),
]);

RoomsState roomsStateReducer(RoomsState roomsState, dynamic action) =>
    RoomsState(roomList: _roomListReducer(roomsState.roomList, action));
