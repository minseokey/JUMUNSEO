import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_response_model.g.dart';
part 'image_response_model.freezed.dart';

@freezed
class ImageResponseModel with _$ImageResponseModel{
  factory ImageResponseModel(
      {required String code,
      required String message,
      required String? data}) = _ImageResponseModel;

  factory ImageResponseModel.fromJson(Map<String, dynamic> json) =>
    _$ImageResponseModelFromJson(json);
}