import 'package:chatrooms/reusable_widgets/appbars/default_appbar.dart';
import 'package:chatrooms/screens/home/widgets/room_list/RoomList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: ChatRoomsAppBar(), body: RoomList());
  }
}