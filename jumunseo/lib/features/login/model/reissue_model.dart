import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jumunseo/features/login/model/reissue_token_model.dart';

part 'reissue_model.g.dart';
part 'reissue_model.freezed.dart';

@freezed
class ReIssueModel with _$ReIssueModel{
  factory ReIssueModel(
      {required String code,
      required String message,
      required ReIssueTokenModel data}) = _ReIssueModel;

  factory ReIssueModel.fromJson(Map<String, dynamic> json) =>
    _$ReIssueModelFromJson(json);
}