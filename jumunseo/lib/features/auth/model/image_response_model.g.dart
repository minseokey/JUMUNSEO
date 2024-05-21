// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageResponseModelImpl _$$ImageResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageResponseModelImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$ImageResponseModelImplToJson(
        _$ImageResponseModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
