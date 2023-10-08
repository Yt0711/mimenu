part of 'table_bloc.dart';

@immutable
sealed class TableEvent {}

class TableLoadData extends TableEvent {
  final String tableID;
  TableLoadData(this.tableID);
}
