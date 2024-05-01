import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_delete_model.g.dart';
part 'user_delete_model.freezed.dart';

@freezed
class UserDeleteModel with _$UserDeleteModel{
  factory UserDeleteModel(
      {required String code,
      required String message,
      required Bool? data}) = _UserDeleteModel;

  factory UserDeleteModel.fromJson(Map<String, dynamic> json) =>
    _$UserDeleteModelFromJson(json);
}