import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dilemma_category_event.dart';
part 'dilemma_category_state.dart';

//pull

class DilemmaCategoryBloc
    extends Bloc<DilemmaCategoryEvent, DilemmaCategoryState> {
  DilemmaCategoryBloc() : super(DilemmaCategoryState()) {
    on<DilemmaCategoryInitial>((event, emit) {
      emit(state.copyWith(status: DilemmaCategoryStatus.loading));
    });
    on<DilemmaCategoryLoaded>((event, emit) {
      emit(state.copyWith(status: DilemmaCategoryStatus.loaded));
    });
    on<DilemmaCategoryLoadingDialog>((event, emit) {
      emit(state.copyWith(status: DilemmaCategoryStatus.loading));
    });
  }
}
