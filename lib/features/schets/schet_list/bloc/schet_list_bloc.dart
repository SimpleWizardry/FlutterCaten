import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/schets/repository/abstractSchetRepository.dart';
import 'package:myapp/features/schets/schet_list/view/schet_list.dart';

import '../../../../generated/schet.pb.dart';
// import '../../services/schet.pb.dart';

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
      
      filterSchet = event.filterSchet;
      debugPrint(event.toString() + filterSchet.toString());
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

    // on<LoadUsers>((event, emit) async {
    //   if (event.init) {
    //     emit(SchetListInitial());
    //   } else {
    //     emit(SchetListLoading());
    //   }
      
    //   filterSchet = event.filterSchet;
    //   debugPrint(event.toString() + filterSchet.toString());

    //   var request = new UserListRequest();
    //   request.firstName = event.name;
    //   request.skip = event.skip;
    //   request.take = event.take;

    //   var _result = await GetIt.I<AbstractSchetRepository>().GetUsers(request);
    //   if (_result.succsecced) {
    //     debugPrint('dddd');
    //     filterSchet.skip += 20;
    //     emit(SchetListSuccessed(
    //         listSchets: _result.list ,
    //         totalCount: _result.count));
    //   } else {
    //     emit(SchetListFailure(
    //         errorMessage: 'Не удалось получить данные с сервера'));
    //   }
    // });
  }
  final AbstractSchetRepository schetRepository;
  FilterSchet filterSchet;
}


class SchetBloc extends Bloc<SchetEvent, SchetState> {
  SchetBloc(this.schetRepository, this.filterSchet)
      : super(SchetInitial()) {
    
    on<GetShet>((event, emit) async {
      if (event.init) {
        emit(SchetInitial());
      } else {
        emit(SchetLoading());
      }
      
      filterSchet = event.filterSchet;
      debugPrint(event.toString() + filterSchet.toString());
      var _result =
          await GetIt.I<AbstractSchetRepository>().GetSchet(filterSchet);
      if (_result.succssed) {
        debugPrint('schet');
        filterSchet.skip += 20;
        emit(SchetSuccessed(
            schet: _result.schet ,
            // totalCount: _result.count
            ));
      } else {
        emit(SchetFailure(
            errorMessage: 'Не удалось получить данные с сервера'));
      }
    });
  }
  final AbstractSchetRepository schetRepository;
  FilterSchet filterSchet;
}


