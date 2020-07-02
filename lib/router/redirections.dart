import 'package:chatrooms/router/route_names.dart';
import 'package:flutter/cupertino.dart';

class CompleteRedirect {
  final BuildContext context;

  CompleteRedirect(this.context);

  factory CompleteRedirect.of(BuildContext context) =>
      CompleteRedirect(context);

  void toHome() {
    Navigator.of(this.context).pushNamedAndRemoveUntil(
      RouteNames.home,
      (route) => false,
    );
  }
}
