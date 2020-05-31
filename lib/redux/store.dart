import 'package:chatrooms/redux/reducers/main.dart';
import 'package:chatrooms/redux/state.dart';
import 'package:redux/redux.dart';

final Store<AppState> appStore = Store<AppState>(
  appReducer,
  initialState: AppState.init(),
);
