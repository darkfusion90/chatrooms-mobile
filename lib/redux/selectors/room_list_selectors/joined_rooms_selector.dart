import 'package:reselect/reselect.dart';

import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/selectors/room_list_selectors/filtered_rooms_selector.dart';
import 'package:chatrooms/redux/selectors/room_list_selectors/rooms_state_selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/redux/state/RoomsState.dart';

final Selector<AppState, RoomListModel> joinedRoomsSelector = createSelector1(
    roomsStateSelector, (RoomsState state) => state.joinedRooms);

RoomListModel filteredJoinedRoomsSelector(AppState state) =>
    filteredRoomsSelector(state, joinedRoomsSelector);
