import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/models/room.dart';

import 'package:chatrooms/redux/selectors/active_room_selectors/active_room_selector.dart';
import 'package:chatrooms/redux/selectors/branch_selectors/current-branch-selector.dart';

import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/services/api/api.dart';

class UpdateActiveRoomMessagesAction {
  final List<RoomMessage> messages;

  UpdateActiveRoomMessagesAction(this.messages);
}

ThunkAction<AppState> updateActiveRoomMessages([
  RoomModel room,
  BranchModel branch,
]) =>
    (Store<AppState> store) async {
      final RoomModel activeRoom = room ?? activeRoomSelector(store.state);
      final BranchModel currentBranch =
          branch ?? currentBranchSelector(store.state);

      List<RoomMessage> messages =
          await Api.roomMessages.getMessages(activeRoom, currentBranch);

      store.dispatch(UpdateActiveRoomMessagesAction(messages));
    };
