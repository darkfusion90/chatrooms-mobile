import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconPosition iconPosition;
  final Widget icon;
  final Widget content;

  const IconContent({
    @required this.icon,
    @required this.content,
    this.iconPosition = IconPosition.leading,
  })  : assert(iconPosition != null),
        assert(icon != null),
        assert(content != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return iconPosition == IconPosition.leading
        ? [icon, content]
        : [content, icon];
  }
}

enum IconPosition { leading, trailing }
