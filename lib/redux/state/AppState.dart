import 'package:chatrooms/redux/state/RoomsState.dart';
import 'package:chatrooms/redux/state/state_interface.dart';
import 'package:flutter/cupertino.dart';

class AppState extends ReduxState {
  RoomsState roomsState;

  AppState({@required this.roomsState}) : assert(roomsState != null);

  factory AppState.init() => AppState(roomsState: RoomsState.init());

  // Creates an instance by applying all properties of state while
  // overriding them with the optional named arguments if provided
  factory AppState.apply(AppState state, {RoomsState roomsState}) =>
      AppState(roomsState: roomsState ?? state.roomsState);

  @override
  bool compareState(other) {
    return other is AppState && (other.roomsState == roomsState);
  }

  @override
  int getHashCode() => roomsState.hashCode;
}
