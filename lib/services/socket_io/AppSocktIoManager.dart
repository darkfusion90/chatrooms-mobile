import 'package:chatrooms/utils/url-provider.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

class AppSocketIoManager {
  static AppSocketIoManager _instance;
  static final String _domain = UrlProvider.homeUrl;
  final SocketIOManager socketIOManager = SocketIOManager();

  factory AppSocketIoManager() {
    if (_instance == null) _instance = AppSocketIoManager._();
    return _instance;
  }

  AppSocketIoManager._() {
    socketIOManager.createSocketIO(_domain, null);
  }

  AppSocketIoManager get instance => _instance;
}
