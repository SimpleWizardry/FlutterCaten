part of 'schet_list_bloc.dart';

class SchetListState {}

class SchetListInitial extends SchetListState {}

class SchetListLoading extends SchetListState {}

class SchetListSuccessed extends SchetListState {
  SchetListSuccessed({
    required this.totalCount,
    required this.listSchets,
  });
  final List<SchetView> listSchets;
  final int totalCount;
}

class SchetListFailure extends SchetListState {
  SchetListFailure({required this.errorMessage});
  final String errorMessage;
}
