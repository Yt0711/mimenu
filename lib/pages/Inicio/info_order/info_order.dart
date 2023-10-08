import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_restaurant/pages/Inicio/bloc/table_bloc.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TableBloc, TableState>(
            builder: (context, state) {
              if (state is TableLoading) {
                return const CircularProgressIndicator();
              }
              if (state is TableLoaded) {
                return Column(
                  children: [
                    Text(state.orderTable.reference.id),
                    Text('aa'),
                  ],
                );
              } else if (state is TableError) {
                return Text(state.error);
              }
              return Container();
            },
          ),
        ));
  }
}
