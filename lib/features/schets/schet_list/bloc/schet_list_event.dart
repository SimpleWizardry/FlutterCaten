part of 'schet_list_bloc.dart';

class SchetListEvent {}

class LoadSchetList extends SchetListEvent {
  final bool init;
  final FilterSchet filterSchet;
  LoadSchetList(this.init, this.filterSchet);
}
