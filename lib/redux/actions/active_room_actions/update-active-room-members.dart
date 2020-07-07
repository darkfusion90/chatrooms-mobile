import 'package:chatrooms/redux/actions/active_room_actions/set-active-room.dart';
import 'package:chatrooms/redux/models/room-member.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/selectors/active_room_selectors/active_room_selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class UpdateActiveRoomMembersAction {
  final List<RoomMember> members;

  UpdateActiveRoomMembersAction(this.members);
}

ThunkAction<AppState> updateActiveRoomMembers([SetActiveRoomAction action]) {
  return (Store<AppState> store) async {
    final RoomModel activeRoom =
        action == null ? activeRoomSelector(store.state) : action.room;

    final List<RoomMember> members =
        await Api.roomMembership.getMembers(activeRoom);

    store.dispatch(UpdateActiveRoomMembersAction(members));
  };
}
