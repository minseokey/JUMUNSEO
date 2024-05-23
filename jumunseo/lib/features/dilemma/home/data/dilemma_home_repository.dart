import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/dilemma_home_model.dart';

part 'dilemma_home_repository.g.dart';

@RestApi(baseUrl: 'http://localhost:8081')
abstract class DilemmaHomeRepository {
  factory DilemmaHomeRepository(Dio dio, {String baseUrl}) =
      _DilemmaHomeRepository;

  @GET('/query/debate/available')
  Future<String> getDilemmaList();
}
