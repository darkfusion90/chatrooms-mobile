import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:chatrooms/redux/state/AppState.dart';
import 'on-active-room-changed-middleware.dart';
import 'on-room-list-changed-middleware.dart';

final List<Middleware<AppState>> storeMiddlewares = [
  thunkMiddleware,
  onRoomListChangedMiddleware,
  onActiveRoomChangedMiddleware,
];
