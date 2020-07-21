import 'package:chatrooms/screens/home/widgets/create_room-fab.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/shared/typedefs/typedef_room_list_filter_cb.dart';
import 'package:chatrooms/redux/models/room_list/room_list_filter.dart';

import 'package:chatrooms/screens/home/RoomSearchDelegate.dart';
import 'package:chatrooms/screens/home/widgets/joined_room_feed.dart';
import 'package:chatrooms/screens/home/widgets/public_room_feed.dart';
import 'package:chatrooms/connector_widgets/RoomListConnector.dart';
import 'package:chatrooms/widgets/search-button.dart';
import 'package:chatrooms/widgets/drawers/default_drawer/default-drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Widget> _children = [PublicRoomFeed(), JoinedRoomFeed()];
  final List<Tab> _tabs = [
    Tab(child: _wrapTabLabel("Public Rooms")),
    Tab(child: _wrapTabLabel("Rooms You've Joined")),
  ];

  static Widget _wrapTabLabel(String label) => Container(
        child: Text(label),
        padding: EdgeInsets.only(bottom: 10),
      );

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RoomListConnector(
      builder: (_, viewModel) => _HomeScreenView(
        tabController: _tabController,
        setSearchFilter: viewModel.setFilter,
        resetSearchFilter: viewModel.resetFilter,
        tabs: _tabs,
        children: _children,
      ),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> children;
  final TabController tabController;
  final RoomListFilterCallback setSearchFilter;
  final VoidCallback resetSearchFilter;

  _HomeScreenView({
    this.tabController,
    this.setSearchFilter,
    this.resetSearchFilter,
    this.tabs,
    this.children,
  })  : assert(setSearchFilter != null),
        assert(resetSearchFilter != null),
        assert(tabController != null),
        assert(tabs != null),
        assert(children != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DefaultDrawer(),
      appBar: AppBar(
        title: Text('ChatRooms'),
        actions: <Widget>[SearchButton(onSearch: _onSearch(context))],
        bottom: TabBar(tabs: tabs, controller: tabController),
      ),
      body: TabBarView(controller: tabController, children: children),
      floatingActionButton: CreateRoomFAB(),
    );
  }

  VoidCallback _onSearch(BuildContext context) {
    return () => showSearch(
          context: context,
          delegate: RoomSearchDelegate(
            builder: (_) => children[tabController.index],
            onSearch: (String query) =>
                setSearchFilter(RoomListFilter(query: query)),
          ),
        );
  }
}
