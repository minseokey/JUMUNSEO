part of 'dilemma_chat_bloc.dart';

sealed class DilemmaChatEvent extends Equatable {
  const DilemmaChatEvent();

  @override
  List<Object> get props => [];
}

final class DilemmaChatLoaded extends DilemmaChatEvent {
  // final Dilemma dilemma;

  // const DilemmaChatLoaded(this.dilemma);

  // @override
  // List<Object> get props => [dilemma];
}
