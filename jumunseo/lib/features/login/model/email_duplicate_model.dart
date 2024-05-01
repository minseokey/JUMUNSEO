import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_duplicate_model.g.dart';
part 'email_duplicate_model.freezed.dart';

@freezed
class EmailDuplicateModel with _$EmailDuplicateModel{
  factory EmailDuplicateModel(
      {required String code,
      required String message,
      required Bool data}) = _EmailDuplicateModel;

  factory EmailDuplicateModel.fromJson(Map<String, dynamic> json) =>
    _$EmailDuplicateModelFromJson(json);
}