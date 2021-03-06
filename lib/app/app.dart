import 'package:chatrooms/app/app_view.dart';
import 'package:chatrooms/redux/actions/account_actions/set-user-account.dart';
import 'package:chatrooms/redux/selectors/account_selectors/account_selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/redux/store.dart';
import 'package:chatrooms/services/socket_io/BaseEventEmitter.dart';
import 'package:chatrooms/services/socket_io/SocketService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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
      child: _ReduxConnector(),
    );
  }

  void _initSocketIo() async {
    final SocketService _socketService = SocketService();
    _socketService.connect();
  }
}

class _ReduxConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      onInit: _updateUserId,
      onDidChange: _setUserId,
      converter: (Store<AppState> store) => store,
      builder: (_, __) => AppView(),
    );
  }

  void _setUserId(Store<AppState> store) {
    final String userId = userIdSelector(store.state);
    if (userId != null) {
      BaseEventEmitter.setUserId(userId: userId);
    }
  }

  void _updateUserId(Store<AppState> store) =>
      store.dispatch(updateUserAccount());
}
