import 'package:chatrooms/shared/controllers/confirmation_status_controller.dart';
import 'package:chatrooms/widgets/bottom_sheets/bottom-sheets-manager.dart';
import 'package:chatrooms/shared/enums/enum_confirmation_status.dart';
import 'package:chatrooms/widgets/prior_confirmation_builder.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/connector_widgets/ActiveRoomConnector.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/screens/room/widgets/modes/room_mode_member.dart';
import 'package:chatrooms/widgets/appbars/room_appbar/room-appbar.dart';
import 'package:chatrooms/widgets/loading_indicator.dart';
import 'package:flutter/scheduler.dart';

class Room extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ActiveRoomConnector(
        builder: (_, ActiveRoomViewModel viewModel) {
          return _RoomView(
            room: viewModel.roomDetails.room,
            resetActiveRoom: viewModel.resetActiveRoom,
          );
        },
      );
}

class _RoomView extends StatelessWidget {
  final RoomModel room;
  final VoidCallback resetActiveRoom;
  final ConfirmationStatusController controller =
      ConfirmationStatusController();

  _RoomView({
    @required this.room,
    @required this.resetActiveRoom,
  });

  @override
  Widget build(BuildContext context) {
    return PriorConfirmationWidget(
      controller: controller,
      onShowConfirmation: () => _onShowConfirmation(context),
      shouldShowConfirmation: room != null && room.isNotMember,
      builder: (BuildContext _context, ConfirmationStatus status) {
        _ensureConfirmationAccepted(_context, status);
        return Scaffold(
          appBar: RoomAppBar(room),
          body: _body,
        );
      },
    );
  }

  Widget get _body {
    if (room == null || room.isMembershipUndetermined || room.isNotMember) {
      return LoadingIndicator();
    }
    return RoomModeViewMember(room: room);
  }

  void _ensureConfirmationAccepted(
    BuildContext context,
    ConfirmationStatus status,
  ) {
    if (status != null && status.isRejected) {
      _postFrame(Navigator.of(context).pop);
    }
  }

  void _onShowConfirmation(BuildContext context) {
    _postFrame((_) async {
      controller.value =
          await BottomSheetsManager.of(context).showAvailRoomMembership(room);
    });
  }

  void _postFrame(FrameCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback(callback);
  }
}
