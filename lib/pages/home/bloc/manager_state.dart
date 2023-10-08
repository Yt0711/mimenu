part of 'manager_bloc.dart';

@immutable
sealed class ManagerState {}

final class ManagerInitial extends ManagerState {}

final class ManagerLoading extends ManagerState {}

final class ManagerLoaded extends ManagerState {
  final Manager manager;
  final List<Restaurant> restaurants;

  ManagerLoaded(this.manager, this.restaurants);
}

final class ManagerError extends ManagerState {
  final String error;

  ManagerError(this.error);
}
