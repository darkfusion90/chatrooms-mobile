import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback onSearch;

  const SearchButton({@required this.onSearch}) : assert(onSearch != null);

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.search), onPressed: onSearch);
  }
}
