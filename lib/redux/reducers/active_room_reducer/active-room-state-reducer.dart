import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/active_room_actions/reset-active-room.dart';
import 'package:chatrooms/redux/state/ActiveRoomState.dart';

import 'package:chatrooms/redux/reducers/active_room_reducer/active-room-members-reducer.dart';
import 'package:chatrooms/redux/reducers/active_room_reducer/active-room-messages-reducer.dart';
import 'package:chatrooms/redux/reducers/active_room_reducer/active-room-reducer.dart';
import 'package:chatrooms/redux/reducers/branch_state_reducer/branch-state-reducer.dart';

ActiveRoomState _reducer(ActiveRoomState state, dynamic action) =>
    ActiveRoomState(
      room: activeRoomReducer(state.room, action),
      branchState: branchStateReducer(state.branchState, action),
      messages: activeRoomMessagesReducer(state.messages, action),
      members: activeRoomMembersReducer(state.members, action),
    );

ActiveRoomState _resetRoomState(_, __) => ActiveRoomState.init();

final Reducer<ActiveRoomState> activeRoomStateReducer = combineReducers([
  _reducer,
  TypedReducer<ActiveRoomState, ResetActiveRoomAction>(_resetRoomState),
]);
