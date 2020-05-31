import 'package:chatrooms/redux/store.dart';
import 'package:chatrooms/screens/home/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ChatRoomsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: appStore,
      child: _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatRooms',
      home: Home(),
    );
  }
}
