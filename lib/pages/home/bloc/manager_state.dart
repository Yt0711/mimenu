part of 'manager_bloc.dart';

@immutable
sealed class ManagerState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ManagerInitial extends ManagerState {}

final class ManagerLoading extends ManagerState {}

final class ManagerLoaded extends ManagerState {
  final Manager manager;
  final List<Restaurant> restaurants;

  ManagerLoaded(this.manager, this.restaurants);
  @override
  List<Object?> get props => [manager, restaurants];
}

final class ManagerError extends ManagerState {
  final String error;

  ManagerError(this.error);
  @override
  List<Object?> get props => [error];
}
