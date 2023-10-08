import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';

import 'alegenos_choice.dart';

class ItemForm extends StatefulWidget {
  const ItemForm({super.key});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  bool availableValue = true;
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
        title: const Text("Añadir un nuevo plato"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                      controller: _nombreController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre del plato',
                          hintText: 'Nombre del plato')),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
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
                const SizedBox(width: 10),
                const Text('Disponible?'),
                Checkbox(
                  value: availableValue,
                  onChanged: (value) {
                    setState(() {
                      availableValue = value!;
                    });
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
            const Column(
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
                const SizedBox(width: 20),
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
