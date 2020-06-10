import 'package:chatrooms/redux/state/AccountState.dart';
import 'package:chatrooms/redux/state/RoomsState.dart';
import 'package:chatrooms/redux/state/state_interface.dart';
import 'package:flutter/cupertino.dart';

class AppState extends ReduxState {
  RoomsState roomsState;
  AccountState accountState;

  AppState({@required this.roomsState, @required this.accountState})
      : assert(roomsState != null),
        assert(accountState != null);

  factory AppState.init() => AppState(
        roomsState: RoomsState.init(),
        accountState: AccountState.init(),
      );

  // Creates an instance by applying all properties of state while
  // overriding them with the optional named arguments if provided
  factory AppState.apply(
    AppState state, {
    RoomsState roomsState,
    AccountState accountState,
  }) {
    roomsState = roomsState ?? state.roomsState;
    accountState = accountState ?? state.accountState;

    return AppState(roomsState: roomsState, accountState: accountState);
  }

  @override
  String toString() => 'AppState(\n'
      'roomsState: $roomsState,\n'
      'accountState: $accountState\n'
      ')';

  @override
  bool compareState(other) =>
      other is AppState &&
      other.roomsState == roomsState &&
      other.accountState == accountState;

  @override
  int getHashCode() => roomsState.hashCode ^ accountState.hashCode;
}
