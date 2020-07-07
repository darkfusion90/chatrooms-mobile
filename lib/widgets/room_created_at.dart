import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/shared/typedefs/typedef_param_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoomCreatedAt extends StatelessWidget {
  final DateFormat _dateFormat = DateFormat('MMM d, yyyy');
  final RoomModel room;
  final ParameterizedWidgetBuilder<String> builder;
  final TextStyle textStyle;

  RoomCreatedAt({@required this.room, this.builder, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final String createdAt = _dateFormat.format(room.createdAt);
    if (builder == null) {
      return Text('Created: $createdAt', style: textStyle);
    }

    return builder(context, createdAt);
  }
}
