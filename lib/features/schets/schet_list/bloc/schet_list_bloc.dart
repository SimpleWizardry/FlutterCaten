import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/schets/repository/abstractSchetRepository.dart';

import '../../services/schet.pb.dart';

part 'schet_list_state.dart';
part 'schet_list_event.dart';

class SchetListBloc extends Bloc<SchetListEvent, SchetListState> {
  SchetListBloc(this.schetRepository, this.filterSchet)
      : super(SchetListInitial()) {
    on<LoadSchetList>((event, emit) async {
      if (event.init) {
        emit(SchetListInitial());
      } else {
        emit(SchetListLoading());
      }
      var _result =
          await GetIt.I<AbstractSchetRepository>().GetSchets(filterSchet);
      if (_result.succssed) {
        debugPrint('dddd');
        filterSchet.skip += 20;
        emit(SchetListSuccessed(
            listSchets: _result.list ,
            totalCount: _result.count));
      } else {
        emit(SchetListFailure(
            errorMessage: 'Не удалось получить данные с сервера'));
      }
    });
  }
  final AbstractSchetRepository schetRepository;
  final FilterSchet filterSchet;
}
