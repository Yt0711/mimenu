import 'package:flutter/material.dart';
import 'package:home_restaurant/Menu/Item_form.dart';

class MenuRestaurant extends StatefulWidget {
  const MenuRestaurant({super.key});

  @override
  State<MenuRestaurant> createState() => _MenuRestaurantState();
}

class _MenuRestaurantState extends State<MenuRestaurant>
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
        title: Text("Mi Menu"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Añadir Nueva Categoría"),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.green; //<-- SEE HERE
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemForm()),
                );
              },
              child: Text("Añadir Platos"),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.green; //<-- SEE HERE
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
            ),
          )
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'Entrantes',
            ),
            Tab(
              text: 'Tallarines',
            ),
            Tab(
              text: 'Bebida',
            ),
            Tab(
              text: 'Postre',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Text("Menu"),
          Text("Menu"),
          Text("Menu"),
          Text("Menu"),
        ],
      ),
    );
  }
}
