import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/bloc/restaurant_bloc.dart';
import '../table/table.dart';

/// Flutter code sample for [TabBar].

class ZoneDesktop extends StatelessWidget {
  const ZoneDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          final zones = restaurant.zones ?? [];
          return DefaultTabController(
            length: (restaurant.zones?.length ?? 0) + 1,
            child: Scaffold(
              appBar: AppBar(
                // title: const Text('TabBar Sample'),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: TabBar(isScrollable: true, tabs: [
                    const Tab(text: 'Todo'),
                    ...zones
                        .map((e) => Tab(
                              text: e.name,
                            ))
                        .toList()
                  ]),
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  RestaurantTablePage(tables: restaurant.tables),
                  ...zones
                      .map((e) => RestaurantTablePage(
                          tables: restaurant.tables
                              ?.where((element) => e.id == element.zone?.id)
                              .toList()))
                      .toList(),
                ],
              ),
            ),
          );
        }
        return const Text('Error');
      },
    );
  }
}
