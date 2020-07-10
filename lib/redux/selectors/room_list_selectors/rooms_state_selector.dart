import 'package:reselect/reselect.dart';

import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/redux/state/RoomsState.dart';

final Selector<AppState, RoomsState> roomsStateSelector =
    (AppState state) => state.roomsState;
