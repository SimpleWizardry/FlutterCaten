part of 'button_schet_card_bloc.dart';

class ButtonSchetCardState {}

class BSCInitial extends ButtonSchetCardState {}

class BSCDownloding extends ButtonSchetCardState {}

class BSCDownlodFuile extends ButtonSchetCardState {
  final String errorMessage;

  BSCDownlodFuile({required this.errorMessage});
}

class BSCChangeStatusLoading extends ButtonSchetCardState {
  BSCChangeStatusLoading();
}

class BSCChangeStatusInit extends ButtonSchetCardState {}

class BSCChangeStatusSuccessed extends ButtonSchetCardState {
  BSCChangeStatusSuccessed();
}

class BSCChangeStatusFuile extends ButtonSchetCardState {
  final String errorMessage;
  BSCChangeStatusFuile({required this.errorMessage});
}
