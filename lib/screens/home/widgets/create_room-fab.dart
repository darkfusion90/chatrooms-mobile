import 'package:flutter/material.dart';

import 'package:chatrooms/router/route_names.dart';

class CreateRoomFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed(RouteNames.createRoom),
      child: Icon(Icons.add),
      tooltip: 'Create Room',
    );
  }
}
