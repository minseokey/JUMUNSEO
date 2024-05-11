import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jumunseo/features/auth/model/token_model.dart';

part 'sign_in_response_model.g.dart';
part 'sign_in_response_model.freezed.dart';

@freezed
class SignInResponseModel with _$SignInResponseModel{
  factory SignInResponseModel(
      {required String code,
      required String message,
      required TokenModel? data}) = _SignInResponseModel;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
    _$SignInResponseModelFromJson(json);
}