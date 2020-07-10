import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:chatrooms/connector_widgets/RoomActionsConnector.dart';
import 'package:chatrooms/redux/models/room.dart';

class RoomListItemActions extends StatelessWidget {
  final RoomModel room;
  
  const RoomListItemActions({@required this.room});
  
  @override
  Widget build(BuildContext context) {
    return RoomActionsConnector(
      room: room,
      builder: (_, viewModel) => _RoomListItemActionsView(viewModel: viewModel),
    );
  }
}

class _RoomListItemActionsView extends StatelessWidget {
  final RoomActionsViewModel viewModel;
  
  const _RoomListItemActionsView({@required this.viewModel})
    : assert(viewModel != null);
  
  @override
  Widget build(BuildContext context) {
    if (viewModel.room.isMembershipUndetermined) {
      return _loadingIndicator(context);
    }
    
    return viewModel.room.isMember
      ? _memberActions(context)
      : _nonMemberActions(context);
  }
  
  Widget _loadingIndicator(BuildContext context) => Container(
    width: 40,
    child: SpinKitThreeBounce(
      size: 20,
      color: Theme.of(context).accentColor,
    ),
  );
  
  Widget _nonMemberActions(BuildContext context) => OutlineButton.icon(
    icon: Icon(Icons.add_circle),
    label: Text('Join'),
    textColor: Theme.of(context).primaryColor,
    onPressed: viewModel.joinRoom,
  );
  
  Widget _memberActions(BuildContext context) => OutlineButton.icon(
    icon: Icon(Icons.exit_to_app),
    label: Text('Leave'),
    textColor: Colors.red,
    onPressed: () {
      viewModel.leaveRoom();
      LeaveRoomConfirmation.of(context).show(viewModel);
    },
  );
}
