import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_info_model.g.dart';
part 'edit_info_model.freezed.dart';

@freezed
class EditInfoModel with _$EditInfoModel{
  factory EditInfoModel(
      {required String email,
      required String name,
      required String accessToken,
      required String refreshToken,}) = _EditInfoModel;

  factory EditInfoModel.fromJson(Map<String, dynamic> json) =>
    _$EditInfoModelFromJson(json);
}