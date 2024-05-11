// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditInfoModelImpl _$$EditInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$EditInfoModelImpl(
      email: json['email'] as String,
      name: json['name'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$EditInfoModelImplToJson(_$EditInfoModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
