import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/selectors/active_room_selectors/active_room_selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class SetBranchList {
  final RoomModel room;
  final List<BranchModel> branches;

  SetBranchList(this.branches, this.room);
}

ThunkAction<AppState> updateBranchList([RoomModel room]) =>
    (Store<AppState> store) async {
      final RoomModel currentRoom = room ?? activeRoomSelector(store.state);
      final List<BranchModel> branches = await Api.branch.ofRoom(currentRoom);

      store.dispatch(SetBranchList(branches, currentRoom));
    };
