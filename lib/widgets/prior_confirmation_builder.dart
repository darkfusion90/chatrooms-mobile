import 'package:chatrooms/shared/typedefs/typedef_param_widget_builder.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/shared/controllers/confirmation_status_controller.dart';
import 'package:chatrooms/shared/enums/enum_confirmation_status.dart';

class PriorConfirmationWidget extends StatefulWidget {
  final ParameterizedWidgetBuilder<ConfirmationStatus> builder;
  final ConfirmationStatusController controller;
  final bool shouldShowConfirmation;
  final VoidCallback onShowConfirmation;

  const PriorConfirmationWidget({
    this.controller,
    @required this.shouldShowConfirmation,
    @required this.onShowConfirmation,
    @required this.builder,
  });

  @override
  _PriorConfirmationWidgetState createState() =>
      _PriorConfirmationWidgetState();
}

class _PriorConfirmationWidgetState extends State<PriorConfirmationWidget> {
  ConfirmationStatusController _controller;
  ConfirmationStatus status;
  bool _didShowConfirmation;

  @override
  void initState() {
    super.initState();
    _didShowConfirmation = false;

    _controller = widget.controller ?? ConfirmationStatusController();
    status = _controller.value;
    _controller.addListener(_onConfirmationStatusChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onConfirmationStatusChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _handleConfirmation();
    print('build prior_conf_widget');
    return widget.builder(context, status);
  }

  void _handleConfirmation() {
    if (_shouldShowConfirmation()) {
      setState(() => _didShowConfirmation = true);
      widget.onShowConfirmation();
    }
  }

  bool _shouldShowConfirmation() {
    return !_didShowConfirmation &&
        status == null &&
        widget.shouldShowConfirmation;
  }

  void _onConfirmationStatusChanged() {
    setState(() => status = _controller.value);
  }
}
