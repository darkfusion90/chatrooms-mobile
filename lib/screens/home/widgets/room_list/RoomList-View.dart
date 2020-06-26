import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/models/room_list/room_list.dart';
import 'package:chatrooms/screens/home/widgets/room_list/widgets/RoomListItem.dart';

class RoomListView extends StatefulWidget {
  final RoomListModel roomList;
  final VoidCallback refreshRoomList;

  RoomListView(this.roomList, this.refreshRoomList);

  @override
  _RoomListViewState createState() => _RoomListViewState();
}

class _RoomListViewState extends State<RoomListView> {
  final ScrollController _scrollController = ScrollController();

  List<RoomModel> get _roomList => widget.roomList.filtered;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: DraggableScrollbar.semicircle(
        child: ListView.separated(
          controller: _scrollController,
          itemCount: _roomList.length,
          itemBuilder: _buildItem,
          separatorBuilder: (_, __) => Divider(),
        ),
        controller: _scrollController,
      ),
      onRefresh: () {
        print('Refresh!');
        widget.refreshRoomList();
        return Future.delayed(Duration(seconds: 2));
      },
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final RoomModel room = _roomList[index];
    return RoomListItem(room);
  }
}
