import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/room_list_actions/SetRoomListFilter.dart';
import 'package:chatrooms/redux/models/room_list/room_list_filter.dart';

RoomListFilter _filterReducer(_, SetRoomListFilterAction action) =>
    action.filter;

final Reducer<RoomListFilter> roomListFilterReducer = combineReducers([
  TypedReducer<RoomListFilter, SetRoomListFilterAction>(_filterReducer),
]);
