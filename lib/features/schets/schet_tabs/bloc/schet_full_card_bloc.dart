import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// import '../../services/schet.pb.dart';

import '../../../../generated/schet.pb.dart';
import '../../repository/abstractSchetRepository.dart';

part 'schet_full_card_state.dart';
part 'schet_full_card_event.dart';

class SchetFullCardBloc extends Bloc<SchetFullCardEvent, SchetFullCardState> {
  SchetFullCardBloc(this.schetRepository) : super(SchetFullCardInitial()) {
    on<LoadSchetFullCard>((event, emit) async {
      try {
        emit(SchetFullCardLoading());
        var filterSchet = FilterSchet.create();
        filterSchet.id = event.id;
        var x = event.id;
        debugPrint('filterSchet.id $x');
        var _result =
            await GetIt.I<AbstractSchetRepository>().GetSchet(filterSchet);
        debugPrint('Received question: $_result ');

        if (_result.succssed) {
          emit(SchetFullCardSuccessed(schet: _result.schet));
        } else {
          emit(SchetFullCardFailure(
              errorMessage: 'Не удалось получить данные с сервера'));
        }
      } catch (e) {
        emit(SchetFullCardFailure(
            errorMessage: 'Не удалось получить данные с сервера'));
      }
    });
  }
  final AbstractSchetRepository schetRepository;
}
