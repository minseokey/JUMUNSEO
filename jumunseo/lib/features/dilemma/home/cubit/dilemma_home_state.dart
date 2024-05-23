part of 'dilemma_home_cubit.dart';

enum DilemmaHomeStatus { loading, success, error }

class DilemmaHomeState extends Equatable {
  const DilemmaHomeState._({
    this.status = DilemmaHomeStatus.loading,
    this.items = const <DilemmaHomeModel>[],
  });

  final DilemmaHomeStatus status;
  final List<DilemmaHomeModel> items;

  const DilemmaHomeState.loading() : this._();

  const DilemmaHomeState.success(List<DilemmaHomeModel> items)
      : this._(status: DilemmaHomeStatus.success, items: items);

  const DilemmaHomeState.error() : this._(status: DilemmaHomeStatus.error);

  @override
  List<Object> get props => [status, items];
}
