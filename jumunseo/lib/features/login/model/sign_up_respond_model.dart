import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_respond_model.g.dart';
part 'sign_up_respond_model.freezed.dart';

@freezed
class SignUpRespondModel with _$SignUpRespondModel{
  factory SignUpRespondModel(
      {required String code,
      required String message,
      required String? data}) = _SignUpRespondModel;

  factory SignUpRespondModel.fromJson(Map<String, dynamic> json) =>
    _$SignUpRespondModelFromJson(json);
}