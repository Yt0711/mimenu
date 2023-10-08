import 'package:flutter/material.dart';

import '../../../src/models/table.dart';

class RestaurantTablePage extends StatelessWidget {
  final List<RestaurantTable>? tables;
  const RestaurantTablePage({super.key, this.tables});

// Aqui tiene que se como una foto de mesa
// Mesa libre -> color gris
// Mesa ocupada -> color rojo
// Mesa pedir cuenta -> color verde
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 300,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: tables
              ?.map((table) => Card(
                    child: InkWell(
                      onTap: () {
                        //cuando pulsa aparece info_order correspondiente
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(30.0),
                                child: Icon(
                                  Icons.table_bar,
                                  size: 100,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Mesa: ${table.number.toString()}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList() ??
          [],
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
    );
  }
}
