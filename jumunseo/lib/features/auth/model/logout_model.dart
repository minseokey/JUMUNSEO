import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jumunseo/features/auth/model/logout_data_token_model.dart';

part 'logout_model.g.dart';
part 'logout_model.freezed.dart';

@freezed
class LogoutModel with _$LogoutModel{
  factory LogoutModel(
      {required String code,
      required String message,
      required LogoutDataTokenModel? data}) = _LogoutModel;

  factory LogoutModel.fromJson(Map<String, dynamic> json) =>
    _$LogoutModelFromJson(json);
}