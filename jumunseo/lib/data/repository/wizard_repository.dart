import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/wizard/chat/parsing/chat_parser.dart';

part 'wizard_repository.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8000')
abstract class WizardRepository {
  factory WizardRepository(Dio dio, {String baseUrl}) = _WizardRepository;

  @GET('/chat/list/{userId}')
  Future<ChatParser> getRooms(@Path() String userId);
}