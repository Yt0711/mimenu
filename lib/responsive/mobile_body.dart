import 'package:flutter/material.dart';

import '../Inicio/inicio_desktop.dart';

class MyMobileBody extends StatefulWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
  final TextEditingController _searchController = TextEditingController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Buscar...',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            // Perform search functionality here
          },
        ),
      ),
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
      body: <Widget>[
        Container(
          child: Center(child: InicioDesktop()),
        ),
        Container(
          child: Center(
            child: Text('Menu_Mobile'),
          ),
        ),
        Container(
          child: Center(
            child: Text('Pedidos_Mobile'),
          ),
        ),
        Container(
          child: Center(
            child: Text('Ajuste_Mobile'),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
