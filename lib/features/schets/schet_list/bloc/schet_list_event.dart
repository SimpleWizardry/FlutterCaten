part of 'schet_list_bloc.dart';

class SchetListEvent {}

class LoadSchetList extends SchetListEvent {
  final bool init;
  final FilterSchet filterSchet;

  LoadSchetList(this.init, this.filterSchet);
}

class SchetEvent {}
class GetShet extends SchetEvent {
  final bool init;
  final FilterSchet filterSchet;

  GetShet(this.init, this.filterSchet);
}

class ChangeStatusSchet extends SchetListEvent {
  final bool init;
  final FilterSchet filterSchet;

  ChangeStatusSchet(this.init, this.filterSchet);
}

class GetResourcesSchet extends SchetListEvent {
  final bool init;
  final FilterSchet filterSchet;

  GetResourcesSchet(this.init, this.filterSchet);
}

// class LoadUsers extends SchetListEvent {
//   final bool init;
//   final FilterSchet filterSchet;

//   final String name;
//   final int take;
//   final int skip;

//   // LoadUsers(this.init, this.filterSchet);
//   LoadUsers(this.name, this.skip, this.take, this.init, this.filterSchet);
// }

