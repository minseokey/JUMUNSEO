part of 'loading_bloc.dart';

enum LoadingStatus {
  loading,
  loaded,
}

final class LoadingState extends Equatable {
  final LoadingStatus status;

  const LoadingState({
    this.status = LoadingStatus.loading,
  });

  @override
  List<Object> get props => [
        status,
      ];
}
