// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dilemma_home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DilemmaHomeModelImpl _$$DilemmaHomeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DilemmaHomeModelImpl(
      id: json['id'] as int?,
      contents: json['contents'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );

Map<String, dynamic> _$$DilemmaHomeModelImplToJson(
        _$DilemmaHomeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contents': instance.contents,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
