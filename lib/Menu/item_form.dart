import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';
import 'package:home_restaurant/Menu/alegenos_choice.dart';

class ItemForm extends StatefulWidget {
  const ItemForm({super.key});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  bool _AvailableValue = true;
  List<String> tags = [];

  @override
  void initState() {
    // _loadPlatosData();
    super.initState();
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Añadir un nuevo plato"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                      controller: _nombreController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre del plato',
                          hintText: 'Nombre del plato')),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: _descripcionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descripcion',
                        hintText: 'Descripcion'),
                  ),
                ),
                SizedBox(width: 10),
                Text('Disponible?'),
                Checkbox(
                  value: _AvailableValue,
                  onChanged: (AvailableValue) {
                    setState(() {
                      _AvailableValue = AvailableValue!;
                    });
                  },
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                SizedBox(height: 10),
                Text('Elige los alegenos correspondientes:'),
                SizedBox(height: 10),
                AlegenosChoice(),
                SizedBox(height: 10),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: ChipTags(
                    list: tags,
                    createTagOnSubmit: true,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
