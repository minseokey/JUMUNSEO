import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:jumunseo/features/dilemma/home/data/dilemma_home_repository.dart';

import '../model/dilemma_home_model.dart';

part 'dilemma_home_state.dart';

class Repository {
  late DilemmaHomeRepository repository;

  Repository() {
    repository = DilemmaHomeRepository(Dio());
  }

  Future<List<DilemmaHomeModel>> fetchItems() async {
    try {
      final getResponse = jsonDecode(await repository.getDilemmaList())['data'];
      if (getResponse.isEmpty) {
        return [];
      }
      final items = getResponse[0]['data']
          .map<DilemmaHomeModel>((item) => DilemmaHomeModel.fromJson(item))
          .toList();
      return items;
    } on Exception catch (e) {
      return [];
    }
  }

  // Future<void> deleteItem(String id) async {
  //   await Future<void>.delayed(Duration(seconds: _randomRange(1, 5)));
  // }
}

class DilemmaHomeCubit extends Cubit<DilemmaHomeState> {
  DilemmaHomeCubit({required this.repository})
      : super(const DilemmaHomeState.loading());

  final Repository repository;

  Future<void> fetchList() async {
    try {
      final items = await repository.fetchItems();
      emit(DilemmaHomeState.success(items));
    } on Exception {
      emit(const DilemmaHomeState.error());
    }
  }

  // Future<void> deleteItem(String id) async {
  //   final deleteInProgress = state.items.map((item) {
  //     return item.id == id ? item.copyWith(isDeleting: true) : item;
  //   }).toList();

  //   emit(ComplexListState.success(deleteInProgress));

  //   unawaited(
  //     repository.deleteItem(id).then((_) {
  //       final deleteSuccess = List.of(state.items)
  //         ..removeWhere((element) => element.id == id);
  //       emit(ComplexListState.success(deleteSuccess));
  //     }),
  //   );
  // }
}
