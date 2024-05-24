import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_data_token_model.g.dart';
part 'logout_data_token_model.freezed.dart';

@freezed
class LogoutDataTokenModel with _$LogoutDataTokenModel{
  factory LogoutDataTokenModel(
      {required String email,
      required String role,
      required String name}) = _LogoutDataTokenModel;

  factory LogoutDataTokenModel.fromJson(Map<String, dynamic> json) =>
    _$LogoutDataTokenModelFromJson(json);
}