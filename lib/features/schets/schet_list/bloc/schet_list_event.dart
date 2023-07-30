part of 'schet_list_bloc.dart';

class SchetListEvent {}

class LoadSchetList extends SchetListEvent {
  final bool init;

  LoadSchetList(this.init);
}
