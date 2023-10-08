part of 'restaurant_bloc.dart';

@immutable
sealed class RestaurantState {}

final class RestaurantInitial extends RestaurantState {}

final class RestaurantLoading extends RestaurantState {}

final class RestaurantLoaded extends RestaurantState {
  final Restaurant restaurant;

  RestaurantLoaded(this.restaurant);
}

final class RestaurantError extends RestaurantState {
  final String message;

  RestaurantError(this.message);
}
