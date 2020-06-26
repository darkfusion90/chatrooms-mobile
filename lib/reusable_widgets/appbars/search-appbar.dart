import 'package:chatrooms/reusable_widgets/SearchButton.dart';
import 'package:chatrooms/reusable_widgets/appbars/appbar-interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SearchAppBar extends BaseAppBar {
  final ValueChanged<String> onSearch;
  final VoidCallback onWillPop;
  final bool shouldSearchOnChange;
  final TextEditingController searchFieldController;

  SearchAppBar({
    @required this.onSearch,
    @required this.onWillPop,
    this.shouldSearchOnChange = false,
    this.searchFieldController,
  })  : assert(onSearch != null),
        assert(onWillPop != null);

  @override
  State<StatefulWidget> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  TextEditingController _defaultController;
  final FocusNode _searchFieldFocusNode = FocusNode();

  TextEditingController get _effectiveController =>
      widget.searchFieldController ?? _defaultController;

  String get _searchFieldText => _effectiveController.text;

  void _onSearchFieldChange() {
    if (widget.shouldSearchOnChange) widget.onSearch(_searchFieldText);
  }

  @override
  void initState() {
    super.initState();
    if (widget.searchFieldController == null)
      _defaultController = TextEditingController();
    _effectiveController.addListener(_onSearchFieldChange);

    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _searchFieldFocusNode.requestFocus(),
    );
  }

  @override
  void dispose() {
    _effectiveController.removeListener(_onSearchFieldChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _backButton(context),
      title: _searchField,
      actions: <Widget>[_searchButton],
    );
  }

  Widget _backButton(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: widget.onWillPop,
      );

  Widget get _searchField {
    final TextStyle _white = TextStyle(color: Colors.white);
    
    return TextField(
      focusNode: _searchFieldFocusNode,
      style: _white,
      decoration: InputDecoration.collapsed(
        hintText: 'Search...',
        hintStyle: _white,
      ),
      controller: _effectiveController,
    );
  }

  Widget get _searchButton =>
      SearchButton(onSearch: () => widget.onSearch(_searchFieldText));
}
