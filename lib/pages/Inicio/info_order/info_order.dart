import 'package:flutter/material.dart';

class InfoOrder extends StatelessWidget {
  InfoOrder({super.key});
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "ID: #12345#",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          ),
        ),
        body: const Text(
            "AQUI APARECE LOS PEDIDOS + IMPORTE CUANDO PULSA LA MESA"));
  }
}
