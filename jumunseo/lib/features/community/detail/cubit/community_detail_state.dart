part of 'community_detail_cubit.dart';

enum CommunityDetailStatus { initial, loading, success, failure }

class CommunityDetailState extends Equatable {
  const CommunityDetailState({
    this.community,
    this.status = CommunityDetailStatus.initial,
  });

  factory CommunityDetailState.loading() {
    return const CommunityDetailState(status: CommunityDetailStatus.loading);
  }

  factory CommunityDetailState.success(CommunityDetailModel community) {
    return CommunityDetailState(
        community: community, status: CommunityDetailStatus.success);
  }

  factory CommunityDetailState.failure() {
    return const CommunityDetailState(status: CommunityDetailStatus.failure);
  }

  factory CommunityDetailState.initial() {
    return const CommunityDetailState();
  }

  final CommunityDetailModel? community;
  final CommunityDetailStatus status;

  CommunityDetailState copyWith({
    CommunityDetailModel? community,
    CommunityDetailStatus? status,
  }) {
    return CommunityDetailState(
      community: community ?? this.community,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [community, status];
}
