import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/screens/home/widgets/room_feed/widgets/room_feed_item.dart';

class RoomFeed extends StatefulWidget {
  final List<RoomModel> roomList;
  final VoidCallback refreshRoomList;
  final Widget emptyFeedWidget;

  RoomFeed({
    @required this.roomList,
    @required this.refreshRoomList,
    @required this.emptyFeedWidget,
  })  : assert(roomList != null),
        assert(refreshRoomList != null),
        assert(emptyFeedWidget != null);

  @override
  _RoomFeedState createState() => _RoomFeedState();
}

class _RoomFeedState extends State<RoomFeed> {
  /// Required for [DraggableScrollbar] (see [build])
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: _body(context),
      onRefresh: () {
        widget.refreshRoomList();
        return Future.delayed(Duration(seconds: 2));
      },
    );
  }

  Widget _body(BuildContext context) {
    if (widget.roomList.isEmpty) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: widget.emptyFeedWidget,
        ),
      );
    }

    return DraggableScrollbar.semicircle(
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 0),
        controller: _scrollController,
        itemCount: widget.roomList.length,
        itemBuilder: _buildItem,
      ),
      controller: _scrollController,
    );
  }

  Widget _buildItem(_, int index) => RoomFeedItem(
        room: widget.roomList[index],
        paddingTop: index == 0 ? 0 : null,
      );
}
