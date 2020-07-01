import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

abstract class FlushbarStore {
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
}
