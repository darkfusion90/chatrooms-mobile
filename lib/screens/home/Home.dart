import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/reusable_widgets/appbars/home-appbar.dart';
import 'package:chatrooms/screens/home/widgets/room_list/RoomList.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HomeAppBar(), body: RoomList());
  }
}