import 'package:chatrooms/redux/actions/active_room_actions/update-active-room-messages.dart';
import 'package:chatrooms/redux/selectors/active_room_selectors/active_room_selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart' hide RefreshCallback;
import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/screens/room/widgets/room_messages_feed/RoomMessageItem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class RoomMessageFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (store) => store,
      builder: (_, store) => _RoomMessageFeedView(
        messages: activeRoomMessagesSelector(store.state),
        refreshMessages: () => updateMessages(store),
      ),
    );
  }

  Future<void> updateMessages(Store<AppState> store) async {
    store.dispatch(updateActiveRoomMessages());
  }
}

class _RoomMessageFeedView extends StatelessWidget {
  final List<RoomMessage> messages;
  final RefreshCallback refreshMessages;
  
  
  const _RoomMessageFeedView({
    @required this.messages,
    @required this.refreshMessages,
  })  : assert(messages != null),
        assert(refreshMessages != null);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: _buildFeed(),
      onRefresh: refreshMessages,
    );
  }

  Widget _buildFeed() {
    if (messages.isEmpty) return _buildEmptyFeed();

    return DashChat();
  }

  Widget _buildEmptyFeed() {
    return Container(
      child: Text('No messages yet'),
      padding: EdgeInsets.only(top: 32.0),
      alignment: AlignmentDirectional.topCenter,
    );
  }

  Widget _buildMessageItem(_, int index) =>
      RoomMessageItem(message: messages[index]);
}
