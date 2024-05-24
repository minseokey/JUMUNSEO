part of 'dilemma_chat_cubit.dart';

enum DilemmaChatStatus { initial, loading, loaded, error }

final class DilemmaChatState extends Equatable {
  final DilemmaChatStatus status;
  //final List<Message> messages;
  //final Dilemma dilemma;
  //final String error;

  const DilemmaChatState({
    this.status = DilemmaChatStatus.initial,
    //this.messages = const [],
    //this.dilemma,
    //this.error,
  });

  DilemmaChatState copyWith({
    DilemmaChatStatus? status,
    //List<Message> messages,
    //Dilemma dilemma,
    //String error,
  }) {
    return DilemmaChatState(
      status: status ?? this.status,
      // messages: messages ?? this.messages,
      // dilemma: dilemma ?? this.dilemma,
      // error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];

  // @override
  // List<Object> get props => [status, messages, dilemma, error];
}
