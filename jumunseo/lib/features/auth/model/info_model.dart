import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_model.g.dart';
part 'info_model.freezed.dart';

@freezed
class InfoModel with _$InfoModel{
  factory InfoModel(
      {required String email,
      required String role,
      required String name}) = _InfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
    _$InfoModelFromJson(json);
}