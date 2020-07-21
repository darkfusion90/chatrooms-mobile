import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:chatrooms/services/socket_io/SocketService.dart';
import 'package:chatrooms/shared/typedefs/typedef_param_widget_builder.dart';
import 'package:chatrooms/utils/send_message.dart' as utils;

import 'package:chatrooms/redux/actions/active_room_actions/update-active-room-messages.dart';
import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/selectors/active_room_selectors/active_room_selector.dart';
import 'package:chatrooms/redux/selectors/branch_selectors/current-branch-selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';

class ActiveRoomMessagesConnector extends StatelessWidget {
  final ParameterizedWidgetBuilder<RoomMessagesConnectorViewModel> builder;

  const ActiveRoomMessagesConnector({@required this.builder})
      : assert(builder != null);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      onInit: (Store<AppState> store) {
        SocketService().onNewMessage((_) => _updateMessages(store));
      },
      converter: (store) => store,
      builder: (_, store) => builder(context, _viewModel(store)),
    );
  }

  RoomMessagesConnectorViewModel _viewModel(Store<AppState> store) {
    final List<RoomMessage> messages = activeRoomMessagesSelector(store.state);

    return RoomMessagesConnectorViewModel(
      messages,
      () => _updateMessages(store),
      (String message) => _sendMessage(store, message),
    );
  }

  void _updateMessages(Store<AppState> store) {
    store.dispatch(updateActiveRoomMessages());
  }

  void _sendMessage(Store<AppState> store, String message) {
    final RoomModel activeRoom = activeRoomSelector(store.state);
    final BranchModel currentBranch = currentBranchSelector(store.state);

    utils.sendMessage(activeRoom, message, currentBranch);
  }
}

class RoomMessagesConnectorViewModel {
  final List<RoomMessage> messages;
  final VoidCallback updateMessages;
  final ValueChanged<String> sendMessage;

  RoomMessagesConnectorViewModel(
    this.messages,
    this.updateMessages,
    this.sendMessage,
  );
}
