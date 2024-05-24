// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dilemma_chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DilemmaChatRoomModelImpl _$$DilemmaChatRoomModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DilemmaChatRoomModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      leftSideOption: json['leftSideOption'] as String,
      rightSideOption: json['rightSideOption'] as String,
      leftSideCount: json['leftSideCount'] as int,
      rightSideCount: json['rightSideCount'] as int,
      createdTime: DateTime.parse(json['createdTime'] as String),
    );

Map<String, dynamic> _$$DilemmaChatRoomModelImplToJson(
        _$DilemmaChatRoomModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'leftSideOption': instance.leftSideOption,
      'rightSideOption': instance.rightSideOption,
      'leftSideCount': instance.leftSideCount,
      'rightSideCount': instance.rightSideCount,
      'createdTime': instance.createdTime.toIso8601String(),
    };
