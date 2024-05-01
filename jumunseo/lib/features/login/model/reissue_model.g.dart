// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reissue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReIssueModelImpl _$$ReIssueModelImplFromJson(Map<String, dynamic> json) =>
    _$ReIssueModelImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      data: ReIssueTokenModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReIssueModelImplToJson(_$ReIssueModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
