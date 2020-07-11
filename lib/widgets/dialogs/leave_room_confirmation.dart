import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/widgets/dialogs/confirmation_dialog.dart';
import 'package:flutter/material.dart';

class LeaveRoomConfirmationDialog extends StatelessWidget {
  final RoomModel room;

  LeaveRoomConfirmationDialog({@required this.room}) : assert(room != null);

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: Text('Leave Room "${room.name}"?'),
      content: _content,
      acceptText: 'Leave Room',
    );
  }

  Widget get _content {
    if (room.type.isPrivate) {
      return Text(
        'This is a private room. '
        'Leaving it will require you to send a join request the next time you wish to join the room. '
        'Are you sure you want to continue?',
      );
    }

    return Text('Are you sure you want leave the room ${room.name}?');
  }
}

class LeaveRoomConfirmationArguments {
  final RoomModel room;

  LeaveRoomConfirmationArguments({this.room});
}
