part of 'restaurant_bloc.dart';

@immutable
sealed class RestaurantState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RestaurantInitial extends RestaurantState {}

final class RestaurantLoading extends RestaurantState {}

final class RestaurantLoaded extends RestaurantState {
  final Restaurant restaurant;

  RestaurantLoaded(this.restaurant);
  @override
  List<Object?> get props => [restaurant];
}

final class RestaurantError extends RestaurantState {
  final String message;

  RestaurantError(this.message);
  @override
  List<Object?> get props => [message];
}
