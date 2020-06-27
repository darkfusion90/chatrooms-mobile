import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/room_list_actions/SetRoomListFilter.dart';
import 'package:chatrooms/redux/models/room_list/room_list_filter.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/widgets/search-button.dart';
import 'package:chatrooms/widgets/appbars/search-appbar.dart';
import 'package:chatrooms/widgets/appbars/appbar-interface.dart';

class HomeAppBar extends BaseAppBar {
  @override
  State<StatefulWidget> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  AppBarMode _appBarMode;

  @override
  void initState() {
    super.initState();
    _appBarMode = AppBarMode.normal;
  }

  void _toggleAppBarMode() => setState(() {
        _appBarMode = _appBarMode.toggle;
      });

  void _setRoomListFilter(Store<AppState> store, RoomListFilter filter) =>
      store.dispatch(SetRoomListFilterAction(filter));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (Store<AppState> store) => store,
      builder: (_, Store<AppState> store) => _AppBarView(
        setRoomListFilter: (filter) => _setRoomListFilter(store, filter),
        appBarMode: _appBarMode,
        toggleAppBarMode: _toggleAppBarMode,
      ),
    );
  }
}

class _AppBarView extends StatelessWidget {
  final ValueChanged<RoomListFilter> setRoomListFilter;
  final AppBarMode appBarMode;
  final VoidCallback toggleAppBarMode;

  const _AppBarView({
    @required this.setRoomListFilter,
    @required this.toggleAppBarMode,
    @required this.appBarMode,
  })  : assert(setRoomListFilter != null),
        assert(toggleAppBarMode != null),
        assert(appBarMode != null);

  bool get _shouldPop => appBarMode.isNormal;

  void _resetRoomListFilter() => setRoomListFilter(RoomListFilter());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: appBarMode.isNormal ? _normalAppBar : _searchAppBar,
      onWillPop: () => Future.value(_shouldPop),
    );
  }

  Widget get _searchAppBar => SearchAppBar(
        onSearch: (searchText) =>
            setRoomListFilter(RoomListFilter(query: searchText.trim())),
        onWillPop: () {
          _resetRoomListFilter();
          toggleAppBarMode();
        },
        shouldSearchOnChange: true,
      );

  Widget get _normalAppBar => AppBar(
        title: Text('ChatRooms'),
        actions: <Widget>[SearchButton(onSearch: toggleAppBarMode)],
      );
}

enum AppBarMode { search, normal }

extension _ on AppBarMode {
  AppBarMode get toggle =>
      this == AppBarMode.normal ? AppBarMode.search : AppBarMode.normal;

  bool get isNormal => this == AppBarMode.normal;

  bool get isSearch => this == AppBarMode.search;
}
