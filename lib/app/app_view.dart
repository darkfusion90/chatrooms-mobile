import 'package:flutter/material.dart';

import 'package:chatrooms/router/route_names.dart';
import 'package:chatrooms/router/router.dart';
import 'package:chatrooms/theme/theme.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialApp(
        title: 'ChatRooms',
        theme: ChatRoomsTheme.defaultTheme,
        initialRoute: RouteNames.home,
        onGenerateRoute: Router.generateRoute,
      ),
      onTap: FocusManager.instance.primaryFocus?.unfocus,
    );
  }
}
