import 'package:chatrooms/services/socket_io/BaseEventEmitter.dart';
import 'package:chatrooms/services/socket_io/SocketEvents.dart';
import 'package:chatrooms/utils/url-provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;

typedef dynamic EventHandler<T>(T data);

class SocketService {
  static final String _domain = UrlProvider.homeUrl;
  static SocketService _instance;

  _SocketServiceEventHandlers _eventHandlers;
  _RoomSocketService room;
  Io.Socket _socket;

  factory SocketService() {
    if (_instance == null) _instance = SocketService._();
    return _instance;
  }

  SocketService._() {
    _socket = Io.io(_domain, {
      'transports': ['websocket'],
      'autoConnect': false,
    });
    _eventHandlers = _SocketServiceEventHandlers(_socket);
    room = _RoomSocketService(_socket);

    onConnect((_) => print('socket connected'));
    onConnectError((err) => print('socket connect error: $err'));
  }

  void connect() {
    _socket.connect();
  }

  void onConnectError(EventHandler handler) =>
      _eventHandlers.add('connect_error', handler);

  void onConnect(EventHandler handler) =>
      _eventHandlers.add('connect', handler);
}

class _SocketServiceEventHandlers {
  final Io.Socket _socket;

  _SocketServiceEventHandlers(this._socket);

  void add(String event, EventHandler handler) {
    if (handler != null) {
      _socket.on(event, handler);
    }
  }

  void remove(String event, EventHandler handler) =>
      _socket.off(event, handler);
}

class _RoomSocketService {
  final Io.Socket _socket;
  static const RoomSocketEvents _events = SocketEvents.room;

  _RoomSocketService(this._socket);

  void joinRoom(String roomId) {
    _emit([_events.connectToRoom, roomId]);
  }

  void _emit([dynamic data]) {
    BaseEventEmitter.instance.emit(_socket, _events.mainEvent, data);
  }
}
