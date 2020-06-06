import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/screens/home/widgets/room_list/widgets/RoomListItem.dart';

class RoomListView extends StatefulWidget {
  final RoomListModel roomList;

  RoomListView(this.roomList);

  @override
  _RoomListViewState createState() => _RoomListViewState();
}

class _RoomListViewState extends State<RoomListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<RoomModel> rooms = widget.roomList.rooms;
    
    return DraggableScrollbar.semicircle(
      child: ListView.separated(
        controller: _scrollController,
        itemCount: rooms.length,
        itemBuilder: (_, int index) => RoomListItem(rooms[index]),
        separatorBuilder: (_, __) => Divider(),
      ),
      controller: _scrollController,
    );
  }
}
