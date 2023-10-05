import 'package:flutter/material.dart';

class RestaurantTable extends StatelessWidget {
  const RestaurantTable({super.key});

// Aqui tiene que se como una foto de mesa
// Mesa libre -> color gris
// Mesa ocupada -> color rojo
// Mesa pedir cuenta -> color verde
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton.large(
              onPressed: () {
                //cuando pulsa aparece info_order correspondiente
              },
              child: const Icon(
                Icons.table_bar,
              ),
            ),
            const Text('Mesa #001#'),
          ],
        );
        // return Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: FloatingActionButton.large(
        //     onPressed: () {
        //       // Add your onPressed code here!
        //     },
        //     child: const Icon(
        //       Icons.table_bar,
        //       size: 100,
        //     ),
        //   ),
        // );
      },
    );
  }
}
