import 'package:chatrooms/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/active_room_actions/set-active-room.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/state/AppState.dart';

class RoomListItem extends StatelessWidget {
  final RoomModel room;

  RoomListItem(this.room);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (Store<AppState> store) =>
          () => store.dispatch(SetActiveRoomAction(room)),
      builder: (_, VoidCallback setActiveRoom) => _RoomListItemView(
        room: room,
        setActiveRoom: setActiveRoom,
      ),
    );
  }
}

class _RoomListItemView extends StatelessWidget {
  final RoomModel room;
  final VoidCallback setActiveRoom;
  final DateFormat _createdAtDateFormatter = DateFormat('MMM d, yyyy');

  _RoomListItemView({@required this.room, @required this.setActiveRoom})
      : assert(room != null),
        assert(setActiveRoom != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(room.name),
      subtitle: _buildSubtitle(),
      trailing: _buildJoinRoomButton(context),
      onTap: () => _handleOnItemTap(context),
    );
  }

  Widget _buildJoinRoomButton(BuildContext context) {
    return OutlineButton(
      child: Text(
        room.membership.isUndetermined
            ? 'Undetermined'
            : (room.membership.isMember ? 'Member' : 'Not Member'),
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      onPressed: () => print('Requesting to join: ${room.name}'),
    );
  }

  Widget _buildSubtitle() {
    final String createdAt = _createdAtDateFormatter.format(room.createdAt);

    return Text('Created: $createdAt');
  }

  void _handleOnItemTap(BuildContext context) {
    setActiveRoom();
    Navigator.of(context).pushNamed(RouteNames.room);
  }
}
