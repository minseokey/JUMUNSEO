part of 'dilemma_category_bloc.dart';

sealed class DilemmaCategoryEvent extends Equatable {
  const DilemmaCategoryEvent();

  @override
  List<Object> get props => [];
}
//pull
final class DilemmaCategoryInitial extends DilemmaCategoryEvent {}

final class DilemmaCategoryLoaded extends DilemmaCategoryEvent {}

final class DilemmaCategoryLoadingDialog extends DilemmaCategoryEvent {}
