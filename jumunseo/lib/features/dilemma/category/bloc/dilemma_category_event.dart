part of 'dilemma_category_bloc.dart';

sealed class DilemmaCategoryEvent extends Equatable {
  const DilemmaCategoryEvent();

  @override
  List<Object> get props => [];
}

final class DilemmaCategoryInitial extends DilemmaCategoryEvent {}

final class DilemmaCategoryLoaded extends DilemmaCategoryEvent {}
