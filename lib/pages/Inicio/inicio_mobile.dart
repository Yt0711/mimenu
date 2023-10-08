import 'package:flutter/material.dart';

class InicioMobile extends StatelessWidget {
  const InicioMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        // Another fixed-height child.
                        color: const Color(0xff008000), // Green
                        height: 75.0,
                        alignment: Alignment.center,
                        child: const Text('Lista Mesa'),
                      ),
                      Container(
                        // A fixed-height child.
                        color: const Color(0xffeeee00), // Yellow
                        height: 500.0,
                        alignment: Alignment.center,
                        child: const Text('Fixed Height Content'),
                      ),
                      Container(
                        // Another fixed-height child.
                        color: const Color(0xff008000), // Green
                        height: 75.0,
                        alignment: Alignment.center,
                        child: const Text('Característica'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        // A fixed-height child.
                        color: const Color(0xffeeee00), // Yellow
                        height: 30.0,
                        alignment: Alignment.center,
                        child: const Text('Numero Pedido'),
                      ),
                      Container(
                        // A fixed-height child.
                        color: const Color(0xffeeee00), // Yellow
                        height: 30.0,
                        alignment: Alignment.center,
                        child: const Text('Comersales / Numero mesa'),
                      ),
                      Container(
                        // Another fixed-height child.
                        color: const Color(0xff008000), // Green
                        height: 600,
                        alignment: Alignment.center,
                        child: const Text('Pedido'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
