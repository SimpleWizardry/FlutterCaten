part of 'schet_full_card_bloc.dart';

class SchetFullCardEvent {}

class LoadSchetFullCard extends SchetFullCardEvent {
  final String id;

  LoadSchetFullCard(this.id);
}
