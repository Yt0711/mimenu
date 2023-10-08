import 'package:flutter/material.dart';
import 'package:home_restaurant/components/main_appbar.dart';
import 'package:home_restaurant/pages/Inicio/inicio_mobile.dart';

import '../pages/Ajustes/settings.dart';
import '../pages/Menu/menu.dart';

class MyMobileBody extends StatefulWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
  // final TextEditingController _searchController = TextEditingController();

  List<Widget> views = [
    const Center(child: InicioMobile()),
    const Center(child: MenuRestaurant()),
    const Center(
        child: Text(
            'lista de pedidos pagos y sus formas de pago, separar los dias')),
    Center(child: AjustesPage()),
  ];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      // appBar: AppBar(
      //   title: TextField(
      //     controller: _searchController,
      //     style: const TextStyle(color: Colors.white),
      //     cursorColor: Colors.white,
      //     decoration: const InputDecoration(
      //       hintText: 'Buscar...',
      //       hintStyle: TextStyle(color: Colors.white54),
      //       border: InputBorder.none,
      //     ),
      //     onChanged: (value) {
      //       // Perform search functionality here
      //     },
      //   ),
      // ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.qr_code),
            label: 'Pedidos',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Ajuste',
          ),
        ],
      ),
      body: views.elementAt(currentPageIndex),
    );
  }
}
