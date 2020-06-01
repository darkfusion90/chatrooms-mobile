
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/screens/home/widgets/room_list/widgets/RoomListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomListView extends StatelessWidget {
  final List<Room> publicRooms;
  
  RoomListView(this.publicRooms);
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: publicRooms.length,
      itemBuilder: (_, int index) => RoomListItem(publicRooms[index]),
      separatorBuilder: (_, __) => Divider(),
    );
  }
}