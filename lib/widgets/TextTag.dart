import 'package:flutter/material.dart';

class TextTag extends StatelessWidget {
  final Color borderColor;
  final Widget child;

  const TextTag({this.borderColor, this.child});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderColor ?? Theme.of(context).primaryColor,
          ),
          color: Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: child,
      );
}
