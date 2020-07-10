import 'package:chatrooms/redux/selectors/room_list_selectors/joined_rooms_selector.dart';
import 'package:chatrooms/redux/selectors/room_list_selectors/public_rooms_selector.dart';
import 'package:reselect/reselect.dart';

import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/state/AppState.dart';

final Selector<AppState, RoomListModel> allRoomsSelector = createSelector2(
  publicRoomsSelector,
  joinedRoomsSelector,
  (RoomListModel publicRooms, RoomListModel joinedRooms) =>
      publicRooms + joinedRooms,
);
