import 'package:dio/dio.dart';
import 'package:jumunseo/features/login/model/sign_up_model.dart';
import 'package:jumunseo/features/login/model/sign_up_respond_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repository.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8080')
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;
 
  @POST('/user/signup')
  Future<SignUpRespondModel> postSignUp(@Body() SignUpModel signup);
}