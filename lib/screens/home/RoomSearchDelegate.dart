import 'package:flutter/material.dart';

class RoomSearchDelegate extends SearchDelegate<String> {
  final WidgetBuilder builder;
  final ValueChanged<String> onSearch;

  RoomSearchDelegate({this.builder, this.onSearch});

  @override
  List<Widget> buildActions(BuildContext context) => [];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: Navigator.of(context).pop,
      );

  @override
  Widget buildResults(BuildContext context) => builder(context);

  @override
  Widget buildSuggestions(BuildContext context) => builder(context);
}
