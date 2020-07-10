import 'package:flutter/material.dart';

class InlineButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final VoidCallback onTap;

  const InlineButton({
    @required this.text,
    @required this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        child: Text(
          text,
          style: textStyle ?? TextStyle(color: Theme.of(context).primaryColor),
        ),
        onTap: onTap,
      );
}
