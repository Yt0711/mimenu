import 'package:flutter/material.dart';
import 'package:home_restaurant/pages/Inicio/info_order/info_order.dart';
import 'package:home_restaurant/pages/Inicio/zones/zone_desktop.dart';

class InicioDesktop extends StatelessWidget {
  const InicioDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: const Column(
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
        );
      },
    );
  }
}
