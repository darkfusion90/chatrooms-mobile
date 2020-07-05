import 'package:flutter/material.dart';

class PrimaryColoredTextFlatButton extends StatelessWidget {
  final Widget child;
  final String text;
  final VoidCallback onPressed;

  const PrimaryColoredTextFlatButton({
    this.text,
    this.onPressed,
    this.child,
  }) : assert(
          text != null || child != null,
          'You must provide either a child or a text(String)',
        );

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Theme.of(context).primaryColor,
      child: text == null ? child : Text(text),
      onPressed: onPressed,
      padding: EdgeInsets.all(4),
    );
  }
}
