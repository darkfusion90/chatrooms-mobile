abstract class SocketEvents {
  static const baseClientEvent = 'event:client:flutter';
  static const RoomSocketEvents room = RoomSocketEvents();
}

class RoomSocketEvents {
  const RoomSocketEvents();

  final String mainEvent = 'event:room';
  final String connectToRoom = 'connect_to_room';
}
