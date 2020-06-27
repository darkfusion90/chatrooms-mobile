import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  static const String _defaultAcceptText = 'Confirm';
  static const String _defaultRejectionText = 'Cancel';
  final Widget title;
  final Widget content;
  final String acceptText;
  final String rejectionText;

  const ConfirmationDialog({
    this.title,
    this.content,
    this.acceptText = _defaultAcceptText,
    this.rejectionText = _defaultRejectionText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: <Widget>[_rejectButton(context), _acceptButton(context)],
    );
  }

  Widget _acceptButton(BuildContext context) => FlatButton(
        child: Text(acceptText),
        onPressed: () => Navigator.of(context).pop(ConfirmationStatus.accepted),
      );

  Widget _rejectButton(BuildContext context) => FlatButton(
        child: Text(rejectionText),
        onPressed: () => Navigator.of(context).pop(ConfirmationStatus.rejected),
      );
}

enum ConfirmationStatus { accepted, rejected }

extension BoolIsGetters on ConfirmationStatus {
  bool get isAccepted => this == ConfirmationStatus.accepted;

  bool get isRejected => this == ConfirmationStatus.rejected;
}
