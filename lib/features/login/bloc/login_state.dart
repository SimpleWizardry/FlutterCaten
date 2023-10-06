part of 'login_bloc.dart';


class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessed extends LoginState {
  LoginSuccessed({
    // required this.totalCount,
    required this.user,
  });
  final user;
  // final int totalCount;
}

class LoginFailure extends LoginState {
  LoginFailure({required this.errorMessage});
  final String errorMessage;
}

// class SchetListState {}

// class SchetListInitial extends SchetListState {}

// class SchetListLoading extends SchetListState {}

// class SchetListSuccessed extends SchetListState {
//   SchetListSuccessed({
//     required this.totalCount,
//     required this.listSchets,
//   });
//   final List<SchetListView> listSchets;
//   final int totalCount;
// }

// class SchetListFailure extends SchetListState {
//   SchetListFailure({required this.errorMessage});
//   final String errorMessage;
// }
