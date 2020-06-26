abstract class SocketEvents {
  static const baseClientEvent = 'event:client:flutter';
  static const RoomSocketEvents room = RoomSocketEvents();
  static const MessageSocketEvents message = MessageSocketEvents();
}

class MessageSocketEvents extends BaseSocketEvents {
  const MessageSocketEvents();

  final String sendMessage = 'send_message';

  @override
  String get mainEvent => 'event:message';
}

class RoomSocketEvents extends BaseSocketEvents {
  const RoomSocketEvents();

  final String connectToRoom = 'connect_to_room';

  @override
  String get mainEvent => 'event:room';
}

abstract class BaseSocketEvents {
  const BaseSocketEvents();

  String get mainEvent;
}
