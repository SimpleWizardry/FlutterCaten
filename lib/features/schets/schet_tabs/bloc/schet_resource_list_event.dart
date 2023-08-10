part of 'schet_resource_list_bloc.dart';

class SchetResourceListEvent {}

class SchetResourceListLoad extends SchetResourceListEvent {
  final String id;
  final bool init;
  SchetResourceListLoad(this.init, {required this.id});
}
