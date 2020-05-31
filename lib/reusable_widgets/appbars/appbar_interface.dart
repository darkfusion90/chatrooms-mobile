import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseAppBar extends StatefulWidget
  implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final PreferredSizeWidget bottom;
  
  BaseAppBar({this.bottom})
    : preferredSize = Size.fromHeight(
    kToolbarHeight + (bottom?.preferredSize?.height ?? 0),
  );
}
