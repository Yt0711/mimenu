import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_restaurant/pages/home/bloc/restaurant_bloc.dart';
import 'package:home_restaurant/src/utils.dart';

import '../../src/models/category.dart';
import '../../src/models/item.dart';
import 'item_form.dart';

class MenuRestaurant extends StatelessWidget {
  const MenuRestaurant({super.key});

  // late final TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
      if (state is RestaurantLoaded) {
        final restaurant = state.restaurant;
        return DefaultTabController(
          length: restaurant.categories?.length ?? 0,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Mi Menu"),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.green; //<-- SEE HERE
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    child: const Text("Añadir Nueva Categoría"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ItemForm()),
                      );
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.green; //<-- SEE HERE
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    child: const Text("Añadir Platos"),
                  ),
                )
              ],
              bottom: TabBar(
                isScrollable: true,
                tabs: restaurant.categories
                        ?.map((e) => Tab(
                              text: e.name,
                            ))
                        .toList() ??
                    const <Widget>[],
              ),
            ),
            body: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1000,
                ),
                child: TabBarView(
                  children: restaurant.categories
                          ?.map((e) => _tabBarView(restaurant.items ?? [], e))
                          .toList() ??
                      const <Widget>[],
                ),
              ),
            ),
          ),
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
  }

  Widget _tabBarView(List<Item> data, Category category) {
    final items = data.where((e) => e.categoryId == category.id).toList();
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: Image.network(item.images?.first.src ?? ''),
          title: Text(item.name),
          subtitle: Text(item.description ?? ''),
          trailing: Text(currencyFormat(item.price)),
        );
      },
    );
  }
}
