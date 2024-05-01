// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reissue_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReIssueTokenModelImpl _$$ReIssueTokenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReIssueTokenModelImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      accessTokenExpiredDate: json['accessTokenExpiredDate'] as String,
    );

Map<String, dynamic> _$$ReIssueTokenModelImplToJson(
        _$ReIssueTokenModelImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'accessTokenExpiredDate': instance.accessTokenExpiredDate,
    };
