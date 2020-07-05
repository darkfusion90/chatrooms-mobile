import 'package:flutter/material.dart';

import 'package:chatrooms/shared/controllers/confirmation_status_controller.dart';
import 'package:chatrooms/shared/enums/enum_confirmation_status.dart';

typedef bool ConfirmationPredicate();

class PriorConfirmationBuilder extends StatefulWidget {
  final Widget child;
  final ConfirmationStatusController controller;
  final ConfirmationPredicate shouldShowConfirmation;
  final VoidCallback onShowConfirmation;

  const PriorConfirmationBuilder({
    this.controller,
    @required this.shouldShowConfirmation,
    @required this.onShowConfirmation,
    @required this.child,
  });

  @override
  _PriorConfirmationBuilderState createState() =>
      _PriorConfirmationBuilderState();
}

class _PriorConfirmationBuilderState extends State<PriorConfirmationBuilder> {
  bool _didShowConfirmation;

  @override
  Widget build(BuildContext context) {
    _handleConfirmation();

    return widget.child;
  }

  void _handleConfirmation() {
    if (_shouldShowConfirmation()) {
      setState(() => _didShowConfirmation = true);
      widget.onShowConfirmation();
    }
  }

  bool _shouldShowConfirmation() {
    final ConfirmationStatus status = widget.controller.value;
    return !_didShowConfirmation &&
        status == null &&
        widget.shouldShowConfirmation();
  }
}
