part of 'manager_bloc.dart';

@immutable
sealed class ManagerEvent {}

final class ManagerLoad extends ManagerEvent {
  final String id;

  ManagerLoad(this.id);
}
