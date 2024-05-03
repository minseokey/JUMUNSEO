// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoTokenModelImpl _$$UserInfoTokenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInfoTokenModelImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      accessTokenExpiredDate:
          DateTime.parse(json['accessTokenExpiredDate'] as String),
      role: json['role'] as String,
    );

Map<String, dynamic> _$$UserInfoTokenModelImplToJson(
        _$UserInfoTokenModelImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'accessTokenExpiredDate':
          instance.accessTokenExpiredDate.toIso8601String(),
      'role': instance.role,
    };
