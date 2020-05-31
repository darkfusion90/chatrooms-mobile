import 'package:chatrooms/reusable_widgets/appbars/appbar_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRoomsAppBar extends BaseAppBar {
  @override
  State<StatefulWidget> createState() => _ChatRoomsAppBarState();
}

class _ChatRoomsAppBarState extends State<ChatRoomsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('ChatRooms'),
    );
  }
}
