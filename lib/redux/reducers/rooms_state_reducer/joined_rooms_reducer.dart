import 'package:redux/redux.dart';

import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/redux/reducers/rooms_state_reducer/room_list_membership_reducer.dart';

final Reducer<RoomListModel> joinedRoomsReducer = combineReducers([
  roomListMembershipReducer,
]);
