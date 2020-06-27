import 'package:chatrooms/widgets/icon-content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomAppbarPopupMenu extends StatelessWidget {
  final List<_PopupItemViewModel> _popupItems = [
    _PopupItemViewModel(
      Icons.exit_to_app,
      'Leave Room',
      () => print('onPressed leave room'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_PopupItemViewModel>(
      itemBuilder: _buildPopupMenuItems,
      offset: Offset(0, 32.0),
      onSelected: (popup) => popup.onItemPressed(),
    );
  }

  List<PopupMenuEntry<_PopupItemViewModel>> _buildPopupMenuItems(_) =>
      _popupItems.map((_PopupItemViewModel popup) => popup.build()).toList();
}

class _PopupItemViewModel {
  final IconData icon;
  final String text;
  final VoidCallback onItemPressed;

  _PopupItemViewModel(this.icon, this.text, this.onItemPressed);

  PopupMenuEntry<_PopupItemViewModel> build() =>
      PopupMenuItem<_PopupItemViewModel>(
        value: this,
        child: IconContent(
          icon: Icon(icon, color: Colors.black),
          content: Text(text),
        ),
      );

  @override
  String toString() => 'PopupItem -> text: $text';
}
