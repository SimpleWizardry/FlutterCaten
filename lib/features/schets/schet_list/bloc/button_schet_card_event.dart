part of 'button_schet_card_bloc.dart';

class ButtonSchetCardEvent {}

class DownloadSchetFile extends ButtonSchetCardEvent {
  final FileDTO file;
  DownloadSchetFile(this.file);
}
