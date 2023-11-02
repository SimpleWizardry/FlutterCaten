part of 'payment_schedule_schet_bloc.dart';

class PaymentScheduleSchetListEvent {}

class PaymentScheduleSchetListLoad extends PaymentScheduleSchetListEvent {
  final String id;
  final bool init;
  PaymentScheduleSchetListLoad({required this.id, required this.init});
}
