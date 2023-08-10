part of 'schet_full_card_bloc.dart';

class SchetFullCardState {}

class SchetFullCardInitial extends SchetFullCardState {}

class SchetFullCardLoading extends SchetFullCardState {}

class SchetFullCardSuccessed extends SchetFullCardState {
  SchetFullCardSuccessed({required this.schet});
  final SchetView schet;
}

class SchetFullCardFailure extends SchetFullCardState {
  SchetFullCardFailure({required this.errorMessage});
  final String errorMessage;
}
