part of 'payment_schedule_schet_bloc.dart';

class PaymentScheduleSchetListState {}

class PaymentScheduleSchetListInit extends PaymentScheduleSchetListState {}

class PaymentScheduleSchetListLoadin extends PaymentScheduleSchetListState {}

class PaymentScheduleSchetListSuccessed extends PaymentScheduleSchetListState {
  PaymentScheduleSchetListSuccessed({
    required this.totalCount,
    required this.listPaymentSchedule,
  });
  final List<PaymentScheduleSchetDTO> listPaymentSchedule;
  final int totalCount;
}

class PaymentScheduleSchetListFailure extends PaymentScheduleSchetListState {
  PaymentScheduleSchetListFailure({required this.errorMessage});
  final String errorMessage;
}
