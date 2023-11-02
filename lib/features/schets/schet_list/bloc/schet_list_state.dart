part of 'schet_list_bloc.dart';

class SchetListState {}

class SchetListInitial extends SchetListState {}

class SchetListLoading extends SchetListState {}

class SchetListSuccessed extends SchetListState {
  SchetListSuccessed({
    required this.totalCount,
    required this.listSchets,
  });
  // final List<SchetList> listSchets;
  final List<SchetView> listSchets;
  final int totalCount;
}

class SchetListFailure extends SchetListState {
  SchetListFailure({required this.errorMessage});
  final String errorMessage;
}



class SchetState {}

class SchetInitial extends SchetState {}

class SchetLoading extends SchetState {}

class SchetSuccessed extends SchetState {
  SchetSuccessed({
    // required this.totalCount,
    required this.schet,
  });
  // final List<SchetList> listSchets;
  final SchetView schet;
  // final int totalCount;
}

class SchetFailure extends SchetState {
  SchetFailure({required this.errorMessage});
  final String errorMessage;
}