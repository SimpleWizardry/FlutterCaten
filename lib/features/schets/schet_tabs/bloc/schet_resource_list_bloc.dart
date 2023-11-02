import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../repository/abstractSchetRepository.dart';
import '../../services/schet.pb.dart';

part 'schet_resource_list_event.dart';
part 'schet_resource_list_state.dart';

class SchetResourceListBloc
    extends Bloc<SchetResourceListEvent, SchetResourceListState> {
  SchetResourceListBloc(this.schetRepository, this.filter)
      : super(SchetResourceListInit()) {
    on<SchetResourceListLoad>((event, emit) async {
      try {
        if (event.init) {
          emit(SchetResourceListInit());
        } else {
          emit(SchetResourceListLoading());
        }
        filter.schetId = event.id;

        debugPrint('filterSchet.id ${event.id}');
        ResultResourceSchet _result =
            await GetIt.I<AbstractSchetRepository>().getResourcesSchet(filter);
        debugPrint('Received question: $_result ');

        if (_result.succssed) {
          emit(SchetResourceListSuccessed(
            listResources: _result.resources,
            totalCount: _result.count,
          ));
        } else {
          emit(SchetResourceListFailure(
              errorMessage: 'Не удалось получить данные с сервера'));
        }
      } catch (e) {
        emit(SchetResourceListFailure(
            errorMessage: 'Не удалось получить данные с сервера'));
      }
    });
  }
  final AbstractSchetRepository schetRepository;
  final FilterResourceSchet filter;
}
