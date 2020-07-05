import 'package:chatrooms/widgets/PrimaryColoredTextFlatButton.dart';
import 'package:flutter/material.dart';

class JoinRoomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title,
            Divider(height: 50, thickness: 2),
            _JoinRoomForm(),
          ],
        ),
      ),
    );
  }

  Widget get _title => Text(
        'Join Room',
        style: TextStyle(
          fontSize: 32,
        ),
      );
}

class _JoinRoomForm extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          _roomIdField,
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_cancelButton(context), _joinRoomButton(context)],
          )
        ],
      ),
    );
  }

  Widget get _roomIdField => TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Enter Room Id',
          border: OutlineInputBorder(),
        ),
      );

  Widget _joinRoomButton(BuildContext context) => FlatButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text('Join Room'),
        onPressed: () {},
      );

  Widget _cancelButton(BuildContext context) => PrimaryColoredTextFlatButton(
        child: Text('Cancel'),
        onPressed: Navigator.of(context).pop,
      );
}
