import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/wizard/chat/parsing/chat_parser.dart';

part 'wizard_repository.g.dart';

@RestApi(baseUrl: 'http://10.0.0.2:8080')
abstract class WizardRepository {
  factory WizardRepository(Dio dio, {String baseUrl}) = _WizardRepository;

  @GET('/chat.list/{userId}')
  Future<ChatParser> getRooms(@Path() String userId);
}