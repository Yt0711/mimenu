import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../src/models/restaurant.dart';
part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantInitial()) {
    on<RestaurantLoad>((event, emit) async {
      emit(RestaurantLoading());
      try {
        emit(RestaurantLoaded(event.restaurant));
      } catch (e) {
        emit(RestaurantError(e.toString()));
      }
    });
  }
}
