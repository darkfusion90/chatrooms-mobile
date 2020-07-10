import 'package:chatrooms/router/route_names.dart';
import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogManager.dart';
import 'package:chatrooms/widgets/dialogs/dialog_manager/DialogNames.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/widgets/InlineButton.dart';

class EmptyFeedIndicator extends StatelessWidget {
  final String title;

  const EmptyFeedIndicator({@required this.title}) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle _subtitleTextStyle =
        textTheme.headline6.copyWith(color: Colors.grey);

    final TextStyle _inlineBtnTextStyle =
        _subtitleTextStyle.copyWith(color: Theme.of(context).primaryColor);

    return Column(
      children: <Widget>[
        Text(
          title,
          style: textTheme.headline5,
        ),
        SizedBox(height: 30),
        _joinRoomOption(context, _subtitleTextStyle, _inlineBtnTextStyle),
        SizedBox(height: 10),
        Text('or', style: _subtitleTextStyle),
        SizedBox(height: 10),
        _createRoomOption(context, _subtitleTextStyle, _inlineBtnTextStyle),
      ],
    );
  }

  Widget _joinRoomOption(
    BuildContext context,
    TextStyle textStyle,
    TextStyle inlineBtnTextStyle,
  ) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('You can', style: textStyle),
          SizedBox(width: 5),
          InlineButton(
            text: 'Join',
            textStyle: inlineBtnTextStyle,
            onTap: () => DialogManager.of(context).show(DialogName.joinRoom),
          ),
          SizedBox(width: 5),
          Text('a room', style: textStyle),
        ],
      );

  Widget _createRoomOption(
    BuildContext context,
    TextStyle textStyle,
    TextStyle inlineBtnTextStyle,
  ) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InlineButton(
            text: 'Create',
            textStyle: inlineBtnTextStyle,
            onTap: () => Navigator.of(context).pushNamed(RouteNames.createRoom),
          ),
          SizedBox(width: 5),
          Text('your own room', style: textStyle),
        ],
      );
}
