import 'package:chatrooms/redux/models/room.dart';
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
  _MessageSocketService message;
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
    message = _MessageSocketService(_socket);

    onConnect((_) => print('socket connected'));
    onConnectError((err) => print('socket connect error: $err'));
    _eventHandlers.add('event:message', (data) {
      print('Message event: $data');
      print('data type: ${data[1].runtimeType}');
    });
  }

  void connect() {
    _socket.connect();
  }

  void onConnectError(EventHandler handler) =>
      _eventHandlers.add('connect_error', handler);

  void onConnect(EventHandler handler) =>
      _eventHandlers.add('connect', handler);

  void onNewMessage(EventHandler handler) {
    _eventHandlers.add(
      message.events.mainEvent,
      (data) => _onNewMessageFilter(data, handler),
    );
  }

  void sendMessage(RoomModel room, String data) =>
      message.sendMessage(room, data);

  void _onNewMessageFilter(dynamic data, EventHandler handler) {
    if (data is! Iterable) return;

    final String subEvent = data[0];
    if (subEvent == message.events.sendMessage) {
      handler(data[1]);
    }
  }
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

class _RoomSocketService extends SubSocketService {
  final Io.Socket socket;
  final RoomSocketEvents events = SocketEvents.room;

  _RoomSocketService(this.socket) : super(socket);

  void joinRoom(String roomId) {
    emit([events.connectToRoom, roomId]);
  }
}

class _MessageSocketService extends SubSocketService {
  final Io.Socket socket;
  final MessageSocketEvents events = SocketEvents.message;

  _MessageSocketService(this.socket) : super(socket);

  void sendMessage(RoomModel room, String message) {
    emit([events.sendMessage, room.id, message]);
  }
}

abstract class SubSocketService {
  final Io.Socket socket;

  BaseSocketEvents get events;

  SubSocketService(this.socket);

  void emit([dynamic data]) {
    BaseEventEmitter.instance.emit(socket, events.mainEvent, data);
  }
}
