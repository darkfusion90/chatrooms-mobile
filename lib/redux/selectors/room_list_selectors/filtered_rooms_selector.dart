import 'package:reselect/reselect.dart';

import 'package:chatrooms/redux/models/room_list/room_list_filter.dart';
import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/selectors/room_list_selectors/room_list_filter_selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';

RoomListModel filteredRoomsSelector(
  AppState state,
  Selector<AppState, RoomListModel> srcRoomsSelector,
) {
  final RoomListModel rooms = srcRoomsSelector(state);
  final RoomListFilter filter = roomListFilterSelector(state);

  return rooms.applyFilter(filter);
}
