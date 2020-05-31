import 'package:chatrooms/redux/reducers/public_rooms_reducer.dart';
import 'package:chatrooms/redux/state.dart';

AppState appReducer(AppState state, dynamic action) =>
    AppState(publicRooms: publicRoomsReducer(state.publicRooms, action));
