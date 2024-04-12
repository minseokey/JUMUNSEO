part of 'dilemma_category_bloc.dart';

enum DilemmaCategoryStatus { initial, loading, loaded, error }

final class DilemmaCategoryState extends Equatable {
  final DilemmaCategoryStatus status;
  //final List<DilemmaCategory> categories;
  final String error;

  const DilemmaCategoryState({
    this.status = DilemmaCategoryStatus.initial,
    //this.categories = const [],
    this.error = '',
  });

  DilemmaCategoryState copyWith({
    DilemmaCategoryStatus? status,
    //List<DilemmaCategory>? categories,
    String? error,
  }) {
    return DilemmaCategoryState(
      status: status ?? this.status,
      //categories: categories ?? this.categories,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        status,
        //categories,
        error,
      ];
}
