import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  static const String _defaultLabelText = 'Password';
  final TextEditingController controller;
  final String labelText;

  const PasswordField({
    this.controller,
    this.labelText = _defaultLabelText,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  PasswordVisibility _visibility;
  TextEditingController _controller;

  void _togglePasswordVisibility() => setState(() {
        _visibility = _visibility.toggle;
      });

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _visibility = PasswordVisibility.hidden;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: _visibility.isHidden,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(Icons.lock),
        suffixIcon: _visibilityIcon,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget get _visibilityIcon => IconButton(
        icon: Icon(
          _visibility.isHidden ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: _togglePasswordVisibility,
      );
}

enum PasswordVisibility { visible, hidden }

extension _ on PasswordVisibility {
  bool get isVisible => this == PasswordVisibility.visible;

  bool get isHidden => this == PasswordVisibility.hidden;

  PasswordVisibility get toggle =>
      this.isHidden ? PasswordVisibility.visible : PasswordVisibility.hidden;
}
