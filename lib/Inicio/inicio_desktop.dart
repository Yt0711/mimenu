import 'package:flutter/material.dart';
import 'package:home_restaurant/Inicio/info_order/info_order.dart';
import 'package:home_restaurant/Inicio/zones/zone_desktop.dart';

class InicioDesktop extends StatefulWidget {
  const InicioDesktop({super.key});

  @override
  State<InicioDesktop> createState() => _InicioDesktopState();
}

class _InicioDesktopState extends State<InicioDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: ZoneDesktop()),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Expanded(child: InfoOrder())],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
