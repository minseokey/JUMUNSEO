part of 'loading_bloc.dart';

sealed class LoadingEvent extends Equatable {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}

final class LoadingStarted extends LoadingEvent {}

final class LoadingFinished extends LoadingEvent {}
