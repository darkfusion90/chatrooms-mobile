import 'package:chatrooms/redux/actions/active_room_actions/update-active-room-messages.dart';
import 'package:chatrooms/redux/models/room-message.dart';
import 'package:chatrooms/redux/selectors/active_room_selectors/active_room_selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

typedef ParameterizedWidgetBuilder<T> = Widget Function(BuildContext, T);

class RoomMessagesConnector extends StatelessWidget {
  final ParameterizedWidgetBuilder<RoomMessagesConnectorViewModel> builder;

  const RoomMessagesConnector({@required this.builder})
      : assert(builder != null);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (store) => store,
      builder: (_, store) => builder(context, _viewModel(store)),
    );
  }

  RoomMessagesConnectorViewModel _viewModel(Store<AppState> store) {
    final List<RoomMessage> messages = activeRoomMessagesSelector(store.state);

    return RoomMessagesConnectorViewModel(
      messages,
      () => updateMessages(store),
    );
  }
 
  Future<void> updateMessages(Store<AppState> store) async {
    store.dispatch(updateActiveRoomMessages());
  }
}

class RoomMessagesConnectorViewModel {
  final List<RoomMessage> messages;
  final VoidCallback updateMessages;

  RoomMessagesConnectorViewModel(this.messages, this.updateMessages);
}
