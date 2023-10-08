import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_restaurant/src/models/restaurant.dart';
import 'package:home_restaurant/src/repositories/firestore_repository.dart';

import '../../../src/models/manager.dart';

part 'manager_event.dart';
part 'manager_state.dart';

class ManagerBloc extends Bloc<ManagerEvent, ManagerState> {
  final FireStoreRepository _repository;

  ManagerBloc(
    this._repository,
  ) : super(ManagerInitial()) {
    on<ManagerLoad>((event, emit) async {
      emit(ManagerLoading());
      try {
        final manager = await _repository.getManager(event.id);
        final restaurants = await _repository.getRestaurantByManager(event.id);
        emit(ManagerLoaded(manager, restaurants));
      } catch (e) {
        emit(ManagerError(e.toString()));
      }
    });
  }
}
