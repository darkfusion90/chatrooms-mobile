import 'package:chatrooms/redux/reducers/public_rooms_reducer.dart';
import 'package:chatrooms/redux/state/AppState.dart';

AppState appReducer(AppState state, dynamic action) =>
    AppState(roomsState: roomsStateReducer(state.roomsState, action));
