part of 'table_bloc.dart';

@immutable
sealed class TableState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class TableInitial extends TableState {}

class TableLoading extends TableState {}

class TableLoaded extends TableState {
  final OrderTable orderTable;
  TableLoaded(this.orderTable);
  @override
  List<Object?> get props => [orderTable];
}

class TableError extends TableState {
  final String error;
  TableError(this.error);
  @override
  List<Object?> get props => [error];
}
