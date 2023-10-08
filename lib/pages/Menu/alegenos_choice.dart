import 'package:flutter/material.dart';

import '../../src/models/allergens.dart';

class AlegenosChoice extends StatefulWidget {
  const AlegenosChoice({super.key});

  @override
  State<AlegenosChoice> createState() => _AlegenosChoiceState();
}

class _AlegenosChoiceState extends State<AlegenosChoice> {
  Set<Allergens> selection = <Allergens>{Allergens.sulfitos};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Allergens>(
      segments: const <ButtonSegment<Allergens>>[
        ButtonSegment<Allergens>(
            value: Allergens.altramuces, label: Text('Altramuces')),
        ButtonSegment<Allergens>(value: Allergens.apio, label: Text('Apio')),
        ButtonSegment<Allergens>(
            value: Allergens.cacahuetes, label: Text('Cacahuetes')),
        ButtonSegment<Allergens>(
            value: Allergens.crustaceos, label: Text('Crustaceos')),
        ButtonSegment<Allergens>(
            value: Allergens.frutosdecascara, label: Text('Frutos de cascara')),
        ButtonSegment<Allergens>(
            value: Allergens.gluten, label: Text('Gluten')),
        ButtonSegment<Allergens>(
            value: Allergens.huevos, label: Text('Huevos')),
        ButtonSegment<Allergens>(
            value: Allergens.lacteos, label: Text('Lacteos')),
        ButtonSegment<Allergens>(
            value: Allergens.moluscos, label: Text('Moluscos')),
        ButtonSegment<Allergens>(
            value: Allergens.mostaza, label: Text('Mostaza')),
        ButtonSegment<Allergens>(
            value: Allergens.pescado, label: Text('Pescado')),
        ButtonSegment<Allergens>(
            value: Allergens.sesamo, label: Text('Sesamo')),
        ButtonSegment<Allergens>(value: Allergens.soja, label: Text('Soja')),
        ButtonSegment<Allergens>(
            value: Allergens.sulfitos, label: Text('Sulfitos')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Allergens> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}
