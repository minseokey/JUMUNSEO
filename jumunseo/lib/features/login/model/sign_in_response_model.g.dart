// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInResponseModelImpl _$$SignInResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SignInResponseModelImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      data: TokenModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignInResponseModelImplToJson(
        _$SignInResponseModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
