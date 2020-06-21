import 'package:chatrooms/redux/actions/account_actions/set-user-account.dart';
import 'package:chatrooms/redux/selectors/account_selectors/account_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:chatrooms/screens/home/Home.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/redux/store.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:chatrooms/services/socket_io/BaseEventEmitter.dart';
import 'package:chatrooms/services/socket_io/SocketService.dart';

class ChatRoomsApp extends StatefulWidget {
  @override
  _ChatRoomsAppState createState() => _ChatRoomsAppState();
}

class _ChatRoomsAppState extends State<ChatRoomsApp> {
  @override
  void initState() {
    super.initState();
    _initSocketIo();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: appStore,
      child: _AppView(),
    );
  }

  void _initSocketIo() async {
    final SocketService _socketService = SocketService();
    _socketService.connect();
  }
}

class _AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      onInit: _updateUserId,
      onDidChange: _setUserId,
      converter: (Store<AppState> store) => store,
      builder: (_, __) => MaterialApp(home: Home(), title: 'ChatRooms'),
    );
  }

  void _setUserId(Store<AppState> store) {
    final String userId = userIdSelector(store.state);
    print('on did change: $userId');
    if (userId != null) {
      BaseEventEmitter.setUserId(userId: userId);
    }
  }

  void _updateUserId(Store<AppState> store) =>
      store.dispatch(updateUserAccount());
}
