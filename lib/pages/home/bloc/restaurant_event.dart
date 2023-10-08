part of 'restaurant_bloc.dart';

@immutable
sealed class RestaurantEvent {}

final class RestaurantLoad extends RestaurantEvent {
  final Restaurant restaurant;

  RestaurantLoad(this.restaurant);
}
