import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_response_model.g.dart';
part 'user_info_response_model.freezed.dart';

@freezed
class InfoModel with _$InfoModel{
  factory InfoModel(
      {required String email,
      required String role,
      required String name}) = _InfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
    _$InfoModelFromJson(json);
}