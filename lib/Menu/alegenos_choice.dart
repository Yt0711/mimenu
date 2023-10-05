import 'package:flutter/material.dart';

enum Alegenos {
  altramuces,
  apio,
  cacahuetes,
  crustaceos,
  frutosdecascara,
  gluten,
  huevos,
  lacteos,
  moluscos,
  mostaza,
  pescado,
  sesamo,
  soja,
  sulfitos,
}

class AlegenosChoice extends StatefulWidget {
  const AlegenosChoice({super.key});

  @override
  State<AlegenosChoice> createState() => _AlegenosChoiceState();
}

class _AlegenosChoiceState extends State<AlegenosChoice> {
  Set<Alegenos> selection = <Alegenos>{Alegenos.sulfitos};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Alegenos>(
      segments: const <ButtonSegment<Alegenos>>[
        ButtonSegment<Alegenos>(
            value: Alegenos.altramuces, label: Text('Altramuces')),
        ButtonSegment<Alegenos>(value: Alegenos.apio, label: Text('Apio')),
        ButtonSegment<Alegenos>(
            value: Alegenos.cacahuetes, label: Text('Cacahuetes')),
        ButtonSegment<Alegenos>(
            value: Alegenos.crustaceos, label: Text('Crustaceos')),
        ButtonSegment<Alegenos>(
            value: Alegenos.frutosdecascara, label: Text('Frutos de cascara')),
        ButtonSegment<Alegenos>(value: Alegenos.gluten, label: Text('Gluten')),
        ButtonSegment<Alegenos>(value: Alegenos.huevos, label: Text('Huevos')),
        ButtonSegment<Alegenos>(
            value: Alegenos.lacteos, label: Text('Lacteos')),
        ButtonSegment<Alegenos>(
            value: Alegenos.moluscos, label: Text('Moluscos')),
        ButtonSegment<Alegenos>(
            value: Alegenos.mostaza, label: Text('Mostaza')),
        ButtonSegment<Alegenos>(
            value: Alegenos.pescado, label: Text('Pescado')),
        ButtonSegment<Alegenos>(value: Alegenos.sesamo, label: Text('Sesamo')),
        ButtonSegment<Alegenos>(value: Alegenos.soja, label: Text('Soja')),
        ButtonSegment<Alegenos>(
            value: Alegenos.sulfitos, label: Text('Sulfitos')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Alegenos> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}
