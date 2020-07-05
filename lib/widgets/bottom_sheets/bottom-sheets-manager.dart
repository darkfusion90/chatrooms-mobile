import 'package:chatrooms/shared/enums/enum_confirmation_status.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/widgets/bottom_sheets/AvailRoomMembershipBottomSheet.dart';

class BottomSheetsManager {
  final BuildContext context;

  BottomSheetsManager(this.context);

  factory BottomSheetsManager.of(BuildContext context) =>
      BottomSheetsManager(context);

  Future<ConfirmationStatus> showAvailRoomMembership(
    RoomModel room,
  ) =>
      showModalBottomSheet<ConfirmationStatus>(
        context: context,
        builder: (_) => AvailRoomMembershipBottomSheet(room: room),
        shape: RoundedRectangleBorder(),
        isDismissible: false,
      );
}
