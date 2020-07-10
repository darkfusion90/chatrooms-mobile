import 'package:chatrooms/screens/home/widgets/empty_feed_indicator.dart';

import 'package:flutter/material.dart';

import 'package:chatrooms/connector_widgets/RoomListConnector.dart';
import 'package:chatrooms/screens/home/widgets/room_feed/room_feed.dart';

class JoinedRoomFeed extends StatelessWidget {
  Widget build(BuildContext context) => RoomListConnector(
        builder: (_, viewModel) => RoomFeed(
          roomList: viewModel.joinedRooms,
          refreshRoomList: () {},
          emptyFeedWidget: _emptyFeed,
        ),
      );

  Widget get _emptyFeed =>
      EmptyFeedIndicator(title: "You haven't joined any room");
}
