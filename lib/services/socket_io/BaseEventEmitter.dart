import 'package:chatrooms/services/socket_io/SocketEvents.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class _Emitter {
  static const _baseEvent = SocketEvents.baseClientEvent;
  String userId;

  _Emitter(this.userId);

  void emit(Socket socket, String event, [dynamic data]) {
    socket.emit(_baseEvent, _joinData(event, data));
  }

  // Final socket event emitted:
  // socket.emit(_baseEvent, [userId, event, data])
  // Actual event and data: [event, data]
  // The _baseEvent and userId are required to handle events from flutter
  // separately because there's an issue about session persistence in the client this app uses
  List<dynamic> _joinData(String event, dynamic data) {
    final List<dynamic> sendData = <dynamic>[userId, event];

    if (data is Iterable) {
      sendData.addAll(data);
    } else if (data != null) {
      sendData.add(data);
    }

    return sendData;
  }
}

class BaseEventEmitter {
  static _Emitter _emitter;

  static void setUserId({@required String userId}) {
    if (_emitter == null)
      _emitter = _Emitter(userId);
    else
      _emitter.userId = userId;
  }

  static _Emitter get instance {
    if (_emitter == null) {
      throw StateError(
        'Emitter instance not initialized. Use BaseEventEmitter.setUserId() to initialize the emitter',
      );
    }
    return _emitter;
  }
}
