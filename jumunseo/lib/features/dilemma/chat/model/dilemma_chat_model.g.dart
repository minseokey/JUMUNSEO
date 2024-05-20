// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dilemma_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DilemmaChatModelImpl _$$DilemmaChatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DilemmaChatModelImpl(
      id: json['id'] as int?,
      type: json['type'] as String,
      side: json['side'] as String,
      userEmail: json['userEmail'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$DilemmaChatModelImplToJson(
        _$DilemmaChatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'side': instance.side,
      'userEmail': instance.userEmail,
      'content': instance.content,
    };
