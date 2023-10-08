import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_restaurant/src/models/order.dart';
import 'package:flutter/material.dart';
import 'package:home_restaurant/src/repositories/firestore_repository.dart';

part 'table_event.dart';
part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  final String _restaurantID;
  final FireStoreRepository _repository;
  TableBloc(this._restaurantID, this._repository) : super(TableInitial()) {
    on<TableLoadData>((event, emit) async {
      emit(TableLoading());
      try {
        final orderTable =
            await _repository.getOrderTable(_restaurantID, event.tableID);

        emit(TableLoaded(orderTable));
      } catch (e) {
        emit(TableError(e.toString()));
      }
    });
  }
}
