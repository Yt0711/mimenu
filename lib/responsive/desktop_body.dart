import 'package:flutter/material.dart';
import 'package:home_restaurant/components/main_appbar.dart';
import 'package:home_restaurant/pages/Ajustes/settings.dart';

import 'package:home_restaurant/pages/Inicio/inicio_desktop.dart';
import 'package:home_restaurant/pages/Menu/menu.dart';
import 'package:side_navigation/side_navigation.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  List<Widget> views = [
    const Center(child: InicioDesktop()),
    const Center(child: MenuRestaurant()),
    const Center(
        child: Text(
            'lista de pedidos pagos y sus formas de pago, separar los dias')),
    Center(child: AjustesPage()),
  ];
  int selectedIndex = 0;
  // final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      // appBar: AppBar(
      //     leading: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: TextField(
      //         controller: _searchController,
      //         style: const TextStyle(color: Colors.white),
      //         cursorColor: Colors.white,
      //         decoration: const InputDecoration(
      //           hintText: 'Buscar Platos...',
      //           hintStyle: TextStyle(color: Colors.white54),
      //           border: InputBorder.none,
      //         ),
      //         onChanged: (value) {
      //           // Perform search functionality here
      //         },
      //       ),
      //     ),
      //     actions: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: ElevatedButton(
      //           onPressed: () {},
      //           style: ButtonStyle(
      //             overlayColor: MaterialStateProperty.resolveWith<Color?>(
      //               (Set<MaterialState> states) {
      //                 if (states.contains(MaterialState.pressed)) {
      //                   return Colors.green; //<-- SEE HERE
      //                 }
      //                 return null; // Defer to the widget's default.
      //               },
      //             ),
      //           ),
      //           child: const Text("Añadir Mesas"),
      //         ),
      //       )
      //     ],
      //     title: const Text("NOMBRE RESTAURANTE")),
      body: Row(children: [
        SideNavigationBar(
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(icon: Icons.home, label: "INICIO"),
              SideNavigationBarItem(icon: Icons.menu, label: "MENU"),
              // SideNavigationBarItem(icon: Icons.payment, label: "PAGO"),
              SideNavigationBarItem(icon: Icons.qr_code, label: "PEDIDOS"),
              SideNavigationBarItem(icon: Icons.settings, label: "AJUSTE"),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            }),
        Expanded(child: views.elementAt(selectedIndex))
      ]),
    );
  }
}
