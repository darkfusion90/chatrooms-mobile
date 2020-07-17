import 'package:flutter/material.dart';

import 'package:chatrooms/connector_widgets/RoomActionsConnector.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'fields/room_type_radio_group.dart';

typedef void OnCreateRoomCallback(CreateRoomFormData data);

class CreateRoomFormData {
  final String roomName;
  final RoomType roomType;

  CreateRoomFormData(this.roomName, this.roomType);

  @override
  String toString() => 'Name: $roomName, Type: $roomType';
}

class CreateRoomForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoomActionsConnector(
      builder: (_, viewModel) => _CreateRoomFormView(
        onCreateRoom: (_) {},
      ),
    );
  }
}

class _CreateRoomFormView extends StatelessWidget {
  static const RoomType _initialRoomType = RoomType.private;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _roomNameCtrl = TextEditingController();
  final RoomTypeController _roomTypeCtrl = RoomTypeController(_initialRoomType);

  final OnCreateRoomCallback onCreateRoom;

  _CreateRoomFormView({@required this.onCreateRoom})
      : assert(onCreateRoom != null);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Form(
        key: _key,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: <Widget>[
              _headline(context),
              SizedBox(height: 50),
              _roomNameField,
              Divider(height: 50),
              _roomTypeRadioGroup,
              SizedBox(height: 30),
              _createRoomButton,
            ],
          ),
        ),
      ),
    );
  }

  Widget _headline(BuildContext context) => Text(
        'Create Room',
        style: Theme.of(context).textTheme.headline4,
      );

  Widget get _roomNameField => TextFormField(
        controller: _roomNameCtrl,
        decoration: InputDecoration(
          labelText: 'Room Name',
          prefixIcon: Icon(Icons.event_note),
          border: OutlineInputBorder(),
        ),
      );

  Widget get _roomTypeRadioGroup =>
      RoomTypeRadioGroup(controller: _roomTypeCtrl);

  Widget get _createRoomButton => OutlineButton(
        borderSide: BorderSide(color: Colors.purple),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        textColor: Colors.purple,
        child: Text('Create Room'),
        onPressed: _submitForm,
      );

  void _submitForm() {
    print(_formData);
    onCreateRoom(_formData);
  }

  CreateRoomFormData get _formData => CreateRoomFormData(
        _roomNameCtrl.text.trim(),
        _roomTypeCtrl.value,
      );
}
