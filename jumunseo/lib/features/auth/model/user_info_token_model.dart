import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_token_model.g.dart';
part 'user_info_token_model.freezed.dart';

@freezed
class UserInfoTokenModel with _$UserInfoTokenModel{
  factory UserInfoTokenModel(
      {required String accessToken,
      required String refreshToken,
      required DateTime accessTokenExpiredDate,
      required String role}) = _UserInfoTokenModel;

  factory UserInfoTokenModel.fromJson(Map<String, dynamic> json) =>
    _$UserInfoTokenModelFromJson(json);
}