import 'package:flutter/material.dart';

import '../ui/table.dart';

/// Flutter code sample for [TabBar].

class ZoneDesktop extends StatefulWidget {
  const ZoneDesktop({super.key});

  @override
  State<ZoneDesktop> createState() => _ZoneDesktopState();
}

class _ZoneDesktopState extends State<ZoneDesktop>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('TabBar Sample'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: 'Sala',
              ),
              Tab(
                text: 'Terraza',
              ),
              Tab(
                text: 'Para Recoger',
              ),
              Tab(
                text: 'A Domicilio',
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          RestaurantTable(),
          RestaurantTable(),
          RestaurantTable(),
          RestaurantTable(),
        ],
      ),
    );
  }
}
