import 'package:chatrooms/connector_widgets/ActiveRoomConnector.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/widgets/TextTag.dart';
import 'package:chatrooms/widgets/appbars/room-info-appbar.dart';
import 'package:chatrooms/widgets/least_space_container.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/room-member.dart';
import 'package:chatrooms/redux/models/room_details_model.dart';
import 'package:chatrooms/redux/models/user.dart';
import 'package:chatrooms/widgets/letter-avatar.dart';

class RoomInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ActiveRoomConnector(
        builder: (_, viewModel) => _RoomInfoScreenView(
          roomDetails: viewModel.roomDetails,
        ),
      );
}

class _RoomInfoScreenView extends StatelessWidget {
  final RoomDetailsModel roomDetails;

  const _RoomInfoScreenView({@required this.roomDetails})
      : assert(roomDetails != null);

  @override
  Widget build(BuildContext context) {
    print('room members: ${roomDetails.members}');
    return Scaffold(
      appBar: RoomInfoAppBar(room: roomDetails.room),
      body: Container(
        child: ListView.builder(
          itemCount: roomDetails.members.length,
          itemBuilder: _itemBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final RoomMember member = roomDetails.members[index];
    final UserModel user = member.user;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      leading: LetterAvatar.medium(username: user.username),
      title: Text(user.username),
      trailing: _RoomMemberRoleTags(
        room: roomDetails.room,
        member: member,
      ),
    );
  }
}

class _RoomMemberRoleTags extends StatelessWidget {
  final RoomModel room;
  final RoomMember member;

  const _RoomMemberRoleTags({Key key, this.room, this.member})
      : assert(room != null),
        assert(member != null);

  @override
  Widget build(BuildContext context) {
    final bool isAdmin = member.isAdmin;
    final bool isCreator = room.isCreator(member.user);

    final Widget adminTag = _adminTag(context);
    final Widget creatorTag = _creatorTag(context);
    final Widget adminCreatorTags = _adminCreatorTags(context);

    Widget tag = LeastSpaceContainer();

    if (isAdmin) {
      tag = isCreator ? adminCreatorTags : adminTag;
    } else if (isCreator) {
      tag = isAdmin ? adminCreatorTags : creatorTag;
    }

    return tag;
  }

  Widget _adminTag(BuildContext context) => TextTag(
        child: Text(
          'Admin',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      );

  Widget _creatorTag(BuildContext context) => TextTag(
        child: Text('Creator', style: TextStyle(color: Colors.deepOrange)),
        borderColor: Colors.deepOrange,
      );

  Widget _adminCreatorTags(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _creatorTag(context),
          SizedBox(width: 8),
          _adminTag(context),
        ],
      );
}
