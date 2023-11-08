import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../generated/schet.pb.dart';
import '../../repository/abstractSchetRepository.dart';
// import '../../services/schet.pb.dart';

part 'payment_schedule_schet_event.dart';
part 'payment_schedule_schet_state.dart';

class PaymentScheduleSchetListBloc
    extends Bloc<PaymentScheduleSchetListEvent, PaymentScheduleSchetListState> {
  PaymentScheduleSchetListBloc(this.schetRepository, this.filter)
      : super(PaymentScheduleSchetListInit()) {
    on<PaymentScheduleSchetListLoad>((event, emit) async {
      try {
        if (event.init) {
          emit(PaymentScheduleSchetListInit());
        } else {
          emit(PaymentScheduleSchetListLoadin());
        }
        filter.schetId = event.id;

        debugPrint('filterSchet.id ${event.id}');
        ResultPaymentScheduleSchet _result =
            await GetIt.I<AbstractSchetRepository>()
                .getPaymentSchedulesSchet(filter);
        debugPrint('Received question: $_result ');

        if (_result.succssed) {
          emit(PaymentScheduleSchetListSuccessed(
            listPaymentSchedule: _result.paymentSchedules,
            totalCount: _result.count,
          ));
        } else {
          emit(PaymentScheduleSchetListFailure(
              errorMessage: 'Не удалось получить данные с сервера'));
        }
      } catch (e) {
        emit(PaymentScheduleSchetListFailure(
            errorMessage: 'Не удалось получить данные с сервера'));
      }
    });
  }
  final AbstractSchetRepository schetRepository;
  final FilterPaymentScheduleSchet filter;
}
