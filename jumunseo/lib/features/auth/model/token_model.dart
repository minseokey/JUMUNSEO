import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.g.dart';
part 'token_model.freezed.dart';

@freezed
class TokenModel with _$TokenModel{
  factory TokenModel(
      {required String accessToken,
      required int expiredTime}) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
    _$TokenModelFromJson(json);
}