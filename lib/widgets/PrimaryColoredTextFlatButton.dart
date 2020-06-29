import 'package:flutter/material.dart';

class PrimaryColoredTextFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryColoredTextFlatButton({
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text ?? '',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      onPressed: onPressed,
      padding: EdgeInsets.all(4),
    );
  }
}
