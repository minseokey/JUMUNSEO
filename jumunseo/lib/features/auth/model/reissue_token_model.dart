import 'package:freezed_annotation/freezed_annotation.dart';

part 'reissue_token_model.g.dart';
part 'reissue_token_model.freezed.dart';

@freezed
class ReIssueTokenModel with _$ReIssueTokenModel{
  factory ReIssueTokenModel(
      {required String accessToken,
      required String refreshToken,
      required String accessTokenExpiredDate}) = _ReIssueTokenModel;

  factory ReIssueTokenModel.fromJson(Map<String, dynamic> json) =>
    _$ReIssueTokenModelFromJson(json);
}