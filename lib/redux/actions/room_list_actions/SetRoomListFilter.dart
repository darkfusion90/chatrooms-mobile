import 'package:redux/redux.dart';

import 'package:chatrooms/redux/models/room_list/room_list_filter.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:redux_thunk/redux_thunk.dart';

class SetRoomListFilterAction {
  final RoomListFilter filter;

  const SetRoomListFilterAction(this.filter);
}

ThunkAction<AppState> resetRoomListFilterAction() => (Store<AppState> store) =>
    store.dispatch(SetRoomListFilterAction(RoomListFilter.noFilter));
