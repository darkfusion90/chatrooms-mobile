import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class StatefulAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final PreferredSizeWidget bottom;

  StatefulAppBar({this.bottom})
      : preferredSize = Size.fromHeight(
          kToolbarHeight + (bottom?.preferredSize?.height ?? 0),
        );
}

abstract class StatelessAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final PreferredSizeWidget bottom;

  StatelessAppBar({this.bottom})
      : preferredSize = Size.fromHeight(
          kToolbarHeight + (bottom?.preferredSize?.height ?? 0),
        );
}