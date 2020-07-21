import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/redux/middlewares/on-active-room-changed-middleware.dart';
import 'package:chatrooms/redux/middlewares/on-room-list-changed-middleware.dart';
import 'package:chatrooms/redux/middlewares/on-account-changed.dart';
import 'package:chatrooms/redux/middlewares/on-branch-list-changed-middleware.dart';
import 'package:chatrooms/redux/middlewares/on-current-branch-changed-middleware.dart';

final List<Middleware<AppState>> storeMiddlewares = [
  thunkMiddleware,
  onRoomListChangedMiddleware,
  onActiveRoomChangedMiddleware,
  onBranchListChangedMiddleware,
  onCurrentBranchChangedMiddleware,
  onAccountChangedMiddleware,
];
