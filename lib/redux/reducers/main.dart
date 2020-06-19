import 'package:chatrooms/redux/reducers/account-state-reducer.dart';
import 'package:chatrooms/redux/reducers/active_room_reducer/active-room-state-reducer.dart';
import 'package:chatrooms/redux/reducers/rooms_state_reducer/rooms-state-reducer.dart';
import 'package:chatrooms/redux/state/AppState.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    roomsState: roomsStateReducer(state.roomsState, action),
    accountState: accountStateReducer(state.accountState, action),
    activeRoomState: activeRoomStateReducer(state.activeRoomState, action),
  );
}
