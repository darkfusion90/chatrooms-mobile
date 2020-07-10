import 'package:chatrooms/redux/models/room.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

abstract class FlushbarStore {
  static Flushbar leaveRoomSuccessful(
    BuildContext context, {
    RoomModel room,
    VoidCallback onUndoLeaveRoom,
  }) =>
      undoActionFlushbar(
        context,
        message: 'Room Successfully Left: "${room.name}"',
        onUndoButtonPressed: onUndoLeaveRoom,
      );

  static final Flushbar accountCreated = successFlushbar(
    title: 'Account Created',
    message: 'Account successfully created',
  );

  static Flushbar successFlushbar({String title, String message}) => Flushbar(
        title: title,
        message: message,
        icon: Icon(Icons.check_circle, color: Colors.green),
        leftBarIndicatorColor: Colors.green,
      );

  static Flushbar undoActionFlushbar(
    BuildContext context, {
    String message,
    VoidCallback onUndoButtonPressed,
  }) =>
      Flushbar(
        leftBarIndicatorColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 3),
        message: message,
        mainButton: FlatButton(
          textColor: Colors.white,
          child: Text('Undo'),
          onPressed: onUndoButtonPressed,
        ),
      );
}
