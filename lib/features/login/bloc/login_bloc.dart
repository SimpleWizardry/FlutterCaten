import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../services/schet.pb.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
    : super(LoginInitial()) {
    
    on<Login>((event, emit) async {
      if (event.init) {
        emit(LoginInitial());
      } else {
        emit(LoginLoading());
      }
      
      debugPrint(event.user.toString());
      // НУЖЕН КАСТ В НОРМАЛЬНЫЙ КЛАСС
      // if (event.user != "") {
      // if (!event.user.isEmpty()) {
      if (event.user.toString() != "") {
        emit(LoginSuccessed(
          user: event.user
        ));
      }
      // var _result =
      //     await GetIt.I<AbstractSchetRepository>().GetSchets(filterSchet);
      // if (_result.succssed) {
      //   debugPrint('dddd');
      //   filterSchet.skip += 20;
      //   emit(SchetListSuccessed(
      //       listSchets: _result.list ,
      //       totalCount: _result.count));
      // } else {
      //   emit(SchetListFailure(
      //       errorMessage: 'Не удалось получить данные с сервера'));
      // }
    });
  }
  // final AbstractSchetRepository schetRepository;
  // FilterSchet filterSchet;
}
