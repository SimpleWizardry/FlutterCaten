part of 'schet_resource_list_bloc.dart';

class SchetResourceListState {}

class SchetResourceListInit extends SchetResourceListState {}

class SchetResourceListLoading extends SchetResourceListState {}

class SchetResourceListSuccessed extends SchetResourceListState {
  SchetResourceListSuccessed({
    required this.totalCount,
    required this.listResources,
  });
  final List<ResourceSchet> listResources;
  final int totalCount;
}

class SchetResourceListFailure extends SchetResourceListState {
  SchetResourceListFailure({required this.errorMessage});
  final String errorMessage;
}
