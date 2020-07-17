import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/room.dart';

class RoomTypeController extends ValueNotifier<RoomType> {
  RoomTypeController([RoomType value]) : super(value);
}

class RoomTypeRadioGroup extends StatefulWidget {
  final RoomTypeController controller;

  const RoomTypeRadioGroup({this.controller});

  @override
  State<StatefulWidget> createState() => _RoomTypeRadioGroupState();
}

class _RoomTypeRadioGroupState extends State<RoomTypeRadioGroup> {
  RoomTypeController controller;
  RoomType _currentRoomType;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? RoomTypeController();
    _currentRoomType = controller.value;
  }

  void _handleRoomTypeChange(RoomType newValue) {
    controller.value = newValue;

    if (this.mounted)
      setState(() {
        _currentRoomType = newValue;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _radioGroupLabel,
        SizedBox(height: 30),
        _typePrivateField,
        _typePublicField,
        _typeUnlistedField,
      ],
    );
  }

  Widget get _radioGroupLabel => Text(
        'Room Type:',
        style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
      );

  Widget _radio(RoomType value, Widget title, String tooltip) =>
      RadioListTile<RoomType>(
        value: value,
        groupValue: _currentRoomType,
        onChanged: _handleRoomTypeChange,
        title: title,
        secondary: IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: null,
          tooltip: tooltip,
        ),
      );

  Widget get _typePrivateField => _radio(
        RoomType.private,
        Text('Private'),
        'Restricted access. Not included in the room feed',
      );

  Widget get _typePublicField => _radio(
        RoomType.public,
        Text('Public'),
        'Open to all and is included in the room feed',
      );

  Widget get _typeUnlistedField => _radio(
        RoomType.unlisted,
        Text('Unlisted'),
        'Open to all but not included in the room feed',
      );
}
