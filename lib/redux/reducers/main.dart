import 'package:chatrooms/redux/reducers/account-state-reducer.dart';
import 'package:chatrooms/redux/reducers/rooms_state_reducer/main.dart';
import 'package:chatrooms/redux/state/AppState.dart';

AppState appReducer(AppState state, dynamic action) {
  print('[appReducer] action: $action, state: $state');
  return AppState(
    roomsState: roomsStateReducer(state.roomsState, action),
    accountState: accountStateReducer(state.accountState, action),
  );
}
