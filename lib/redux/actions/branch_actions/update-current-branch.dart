import 'package:chatrooms/redux/actions/branch_actions/update-branch-list.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/selectors/active_room_selectors/active_room_selector.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:chatrooms/redux/selectors/branch_selectors/main-branch-selector.dart';
import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/redux/state/AppState.dart';

class SetCurrentBranch {
  final RoomModel room;
  final BranchModel branch;

  SetCurrentBranch(this.branch, this.room);
}

ThunkAction<AppState> initializeCurrentBranch([SetBranchList action]) =>
    (Store<AppState> store) async {
      final BranchModel mainBranch = filterMainBranch(action.branches);
      final RoomModel activeRoom =
          action.room ?? activeRoomSelector(store.state);
      print('main branch: $mainBranch');

      store.dispatch(SetCurrentBranch(mainBranch, activeRoom));
    };
