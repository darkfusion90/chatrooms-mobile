import 'package:chatrooms/widgets/bottom_sheets/bottom-sheets-manager.dart';
import 'package:chatrooms/shared/enums/enum_confirmation_status.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/connector_widgets/ActiveRoomConnector.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/screens/room/widgets/modes/room_mode_member.dart';
import 'package:chatrooms/widgets/appbars/room_appbar/room-appbar.dart';
import 'package:chatrooms/widgets/loading_indicator.dart';
import 'package:flutter/scheduler.dart';

class Room extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActiveRoomConnector(
      builder: (_, ActiveRoomViewModel viewModel) => _RoomView(
        room: viewModel.room,
        resetActiveRoom: viewModel.resetActiveRoom,
      ),
    );
  }
}

class _RoomView extends StatefulWidget {
  final RoomModel room;
  final VoidCallback resetActiveRoom;

  const _RoomView({
    @required this.room,
    @required this.resetActiveRoom,
  });

  @override
  State<StatefulWidget> createState() => _RoomViewState();
}

class _RoomViewState extends State<_RoomView> {
  ConfirmationStatus status;
  bool didShowMembershipAvailRequest;

  @override
  void initState() {
    super.initState();
    didShowMembershipAvailRequest = false;
  }

  @override
  Widget build(BuildContext context) {
    _handleNoRoomMembership();
    return Scaffold(
      appBar: RoomAppBar(widget.room),
      body: _body,
    );
  }

  void _handleNoRoomMembership() {
    if (widget.room.isMember) return;

    if (status == null && !didShowMembershipAvailRequest) {
      setState(() {
        didShowMembershipAvailRequest = true;
      });
      _showMembershipAvailRequest();
    } else if (status.isRejected) {
      // Since the user is still not a member and we cannot bombard them with the modal every time,
      // it is safe to not show the room at all and simply pop back to the previous route
      _postFrame((_) {
        Navigator.of(context).pop();
      });
    }
  }

  void _showMembershipAvailRequest() {
    _postFrame((_) async {
      final ConfirmationStatus status = await BottomSheetsManager.of(
        context,
      ).showAvailRoomMembership(widget.room);

      setState(() {
        this.status = status;
      });
    });
  }

  void _postFrame(FrameCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback(callback);
  }

  Widget get _body {
    if (widget.room == null ||
        widget.room.isMembershipUndetermined ||
        widget.room.isNotMember) {
      return LoadingIndicator();
    }

    return RoomModeViewMember();
  }
}
