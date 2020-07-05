import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:chatrooms/connector_widgets/RoomActionsConnector.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/widgets/PrimaryColoredTextFlatButton.dart';
import 'package:chatrooms/shared/enums/enum_confirmation_status.dart';

class AvailRoomMembershipBottomSheet extends StatelessWidget {
  final RoomModel room;

  const AvailRoomMembershipBottomSheet({@required this.room})
      : assert(room != null);

  @override
  Widget build(BuildContext context) {
    if (room.isMember) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => Navigator.of(context).pop());
    }

    final TextTheme textTheme = Theme.of(context).textTheme;

    return BottomSheet(
      builder: (_) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are not a member of this room',
              style: textTheme.headline5,
            ),
            SizedBox(height: 20),
            Text(
              'To avail access, you must join the room',
              style: textTheme.subtitle1,
            ),
            SizedBox(height: 20),
            _AvailRoomMembershipActions(room: room),
          ],
        ),
      ),
      onClosing: () {},
    );
  }
}

class _AvailRoomMembershipActions extends StatelessWidget {
  final RoomModel room;

  const _AvailRoomMembershipActions({@required this.room})
      : assert(room != null);

  @override
  Widget build(BuildContext context) {
    return RoomActionsConnector(
      room: room,
      builder: (_, viewModel) => _AvailRoomMembershipActionsView(
        room: room,
        onJoinRoom: viewModel.joinRoom,
        onSendJoinRequest: () {},
      ),
    );
  }
}

class _AvailRoomMembershipActionsView extends StatelessWidget {
  final TextStyle _btnTextStyle = TextStyle(fontSize: 16);
  final RoomModel room;
  final VoidCallback onJoinRoom;
  final VoidCallback onSendJoinRequest;

  _AvailRoomMembershipActionsView({
    @required this.room,
    @required this.onJoinRoom,
    @required this.onSendJoinRequest,
  })  : assert(room != null),
        assert(onJoinRoom != null),
        assert(onSendJoinRequest != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _secondaryAction(context),
        _primaryAction(context),
      ],
    );
  }

  Widget _primaryAction(BuildContext context) {
    final String text = room.type.isPrivate ? 'Send Join Request' : 'Join Room';
    final VoidCallback onPressed =
        room.type.isPrivate ? onSendJoinRequest : onJoinRoom;

    return FlatButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: Text(text, style: _btnTextStyle),
      onPressed: () {
        onPressed();
        Navigator.of(context).pop(ConfirmationStatus.accepted);
      },
    );
  }

  Widget _secondaryAction(BuildContext context) => PrimaryColoredTextFlatButton(
        child: Text('Cancel', style: _btnTextStyle),
        onPressed: () => Navigator.of(context).pop(ConfirmationStatus.rejected),
      );
}
