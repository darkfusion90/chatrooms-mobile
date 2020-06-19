import 'package:chatrooms/redux/state/AccountState.dart';
import 'package:chatrooms/redux/state/ActiveRoomState.dart';
import 'package:chatrooms/redux/state/RoomsState.dart';
import 'package:chatrooms/redux/state/state_interface.dart';
import 'package:flutter/cupertino.dart';

class AppState extends ReduxState {
  final RoomsState roomsState;
  final ActiveRoomState activeRoomState;
  final AccountState accountState;

  AppState({
    @required this.roomsState,
    @required this.activeRoomState,
    @required this.accountState,
  })  : assert(roomsState != null),
        assert(accountState != null);

  factory AppState.init() => AppState(
        roomsState: RoomsState.init(),
        activeRoomState: ActiveRoomState.init(),
        accountState: AccountState.init(),
      );

  // Creates an instance by applying all properties of state while
  // overriding them with the optional named arguments if provided
  factory AppState.apply(
    AppState state, {
    RoomsState roomsState,
    AccountState accountState,
    ActiveRoomState activeRoomState,
  }) {
    roomsState = roomsState ?? state.roomsState;
    accountState = accountState ?? state.accountState;
    activeRoomState = activeRoomState ?? state.activeRoomState;

    return AppState(
      roomsState: roomsState,
      activeRoomState: activeRoomState,
      accountState: accountState,
    );
  }

  @override
  String toString() => 'AppState(\n'
      'roomsState: $roomsState,\n'
      'accountState: $accountState\n'
      'activeRoomState: $activeRoomState\n'
      ')';

  @override
  bool compareState(other) =>
      other is AppState &&
      other.roomsState == roomsState &&
      other.accountState == accountState &&
      other.activeRoomState == activeRoomState;

  @override
  int getHashCode() =>
      roomsState.hashCode ^ activeRoomState.hashCode ^ accountState.hashCode;
}
