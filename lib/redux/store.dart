import 'package:redux/redux.dart';

import 'package:chatrooms/redux/middlewares/middlewares.dart';
import 'package:chatrooms/redux/reducers/main.dart';
import 'package:chatrooms/redux/state/AppState.dart';

final Store<AppState> appStore = Store<AppState>(
  appReducer,
  initialState: AppState.init(),
  middleware: storeMiddlewares,
);
