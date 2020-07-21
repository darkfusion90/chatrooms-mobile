import 'package:reselect/reselect.dart';

import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/redux/state/BranchState.dart';

final Selector<AppState, BranchState> branchStateSelector =
    (AppState state) => state.activeRoomState.branchState;
