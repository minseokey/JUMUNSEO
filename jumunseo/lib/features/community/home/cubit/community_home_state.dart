part of 'community_home_cubit.dart';

class CommunityHomeState extends Equatable {
  const CommunityHomeState({
    this.isLoading = false,
    this.error = '',
  });

  final bool isLoading;
  final String error;

  CommunityHomeState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return CommunityHomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [isLoading, error];
}
