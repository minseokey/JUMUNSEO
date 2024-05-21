import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_model.g.dart';
part 'sign_up_model.freezed.dart';

@freezed
class SignUpModel with _$SignUpModel{
  factory SignUpModel(
      {required String name,
      required String email,
      required String password}) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
    _$SignUpModelFromJson(json);
}