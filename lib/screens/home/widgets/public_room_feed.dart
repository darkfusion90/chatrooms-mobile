import 'package:flutter/material.dart';

import 'package:chatrooms/connector_widgets/RoomListConnector.dart';
import 'package:chatrooms/screens/home/widgets/room_feed/room_feed.dart';

import 'empty_feed_indicator.dart';

class PublicRoomFeed extends StatelessWidget {
  Widget build(BuildContext context) => RoomListConnector(
        category: RoomListCategory.public,
        builder: (_, viewModel) => RoomFeed(
          roomList: viewModel.publicRooms,
          refreshRoomList: viewModel.fetchPublicRooms,
          emptyFeedWidget: _emptyFeed,
        ),
      );

  Widget get _emptyFeed =>
      EmptyFeedIndicator(title: 'There are no public rooms available');
}
