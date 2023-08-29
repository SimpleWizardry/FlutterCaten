part of 'button_schet_card_bloc.dart';

class ButtonSchetCardEvent {}

class DownloadSchetFile extends ButtonSchetCardEvent {
  final FileDTO file;
  DownloadSchetFile(this.file);
}

class BSCChangeStatusInitEvent extends ButtonSchetCardEvent {}

class BSCChangeStatus extends ButtonSchetCardEvent {
  final FilterChangeStatus filter;
  BSCChangeStatus(this.filter);
}
