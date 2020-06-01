import 'package:chatrooms/redux/reducers/main.dart';
import 'package:chatrooms/redux/state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

final Store<AppState> appStore = Store<AppState>(
  appReducer,
  initialState: AppState.init(),
  middleware: [thunkMiddleware],
);
