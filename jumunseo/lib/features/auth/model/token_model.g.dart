// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenModelImpl _$$TokenModelImplFromJson(Map<String, dynamic> json) =>
    _$TokenModelImpl(
      expiredTime: json['expiredTime'] as int,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$$TokenModelImplToJson(_$TokenModelImpl instance) =>
    <String, dynamic>{
      'expiredTime': instance.expiredTime,
      'accessToken': instance.accessToken,
    };
