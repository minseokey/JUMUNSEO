import 'package:dio/dio.dart';
import 'package:jumunseo/features/login/model/email_duplicate_model.dart';
import 'package:jumunseo/features/login/model/logout_model.dart';
import 'package:jumunseo/features/login/model/sign_in_model.dart';
import 'package:jumunseo/features/login/model/sign_in_response_model.dart';
import 'package:jumunseo/features/login/model/sign_up_model.dart';
import 'package:jumunseo/features/login/model/sign_up_respond_model.dart';
import 'package:jumunseo/features/login/model/user_delete_model.dart';
import 'package:jumunseo/features/login/model/user_info_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repository.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8080')
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;
 
  @POST('/user/signup')
  Future<SignUpRespondModel> postSignUp(@Body() SignUpModel signup);

  @GET('/user/duplicate/{email}')
  Future<EmailDuplicateModel> getEmailDuplicate(@Path() String email);

  @GET('/user/info')
  Future<UserInfoResponseModel> getUserInfo(@Header('Authorization') String accessToken);

  @DELETE('/user/delete')
  Future<UserDeleteModel> deleteUser(@Header('Authorization') String accessToken);

  @GET('/user/info')
  Future<LogoutModel> logout(@Header('Authorization') String accessToken);

  @GET('/login')
  Future<SignInResponseModel> getReIssue(@Body() SignInModel signin);
}