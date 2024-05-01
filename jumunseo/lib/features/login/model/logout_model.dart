import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_model.g.dart';
part 'logout_model.freezed.dart';

@freezed
class LogoutModel with _$LogoutModel{
  factory LogoutModel(
      {required String code,
      required String message,
      required Bool? data}) = _LogoutModel;

  factory LogoutModel.fromJson(Map<String, dynamic> json) =>
    _$LogoutModelFromJson(json);
}