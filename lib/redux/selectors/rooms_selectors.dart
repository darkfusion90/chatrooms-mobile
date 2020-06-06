import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:reselect/reselect.dart';

final Selector<AppState, RoomListModel> roomListSelector =
    (AppState state) => state.roomsState.roomList;

final Selector<AppState, List<RoomModel>> roomsSelector =
    createSelector1<AppState, RoomListModel, List<RoomModel>>(
  roomListSelector,
  (RoomListModel roomList) => roomList.rooms,
);

final publicRoomsSelector =
    createSelector1<AppState, List<RoomModel>, List<RoomModel>>(
  roomsSelector,
  (List<RoomModel> rooms) => rooms.where((room) => room.type.isPublic),
);
