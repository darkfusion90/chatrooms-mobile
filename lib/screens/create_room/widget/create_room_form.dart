import 'package:chatrooms/connector_widgets/RoomActionsConnector.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:flutter/material.dart';

typedef void OnCreateRoomCallback(CreateRoomFormData data);

class CreateRoomFormData {
  final String roomName;
  final RoomType roomType;

  CreateRoomFormData(this.roomName, this.roomType);

  @override
  String toString() => 'Name: $roomName, Type: $roomType';
}

class RoomTypeController extends ValueNotifier<RoomType> {
  RoomTypeController([RoomType value]) : super(value);
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
      _RoomTypeRadioGroup(controller: _roomTypeCtrl);

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

class _RoomTypeRadioGroup extends StatefulWidget {
  final RoomTypeController controller;

  const _RoomTypeRadioGroup({this.controller});

  @override
  State<StatefulWidget> createState() => _RoomTypeRadioGroupState();
}

class _RoomTypeRadioGroupState extends State<_RoomTypeRadioGroup> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _radioGroupLabel,
        SizedBox(height: 20),
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
