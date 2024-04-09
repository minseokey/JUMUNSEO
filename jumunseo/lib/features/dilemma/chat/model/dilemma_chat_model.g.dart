// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dilemma_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DilemmaChatModelImpl _$$DilemmaChatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DilemmaChatModelImpl(
      id: json['id'] as String?,
      sendTime: DateTime.parse(json['sendTime'] as String),
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      chatType: $enumDecode(_$ChatTypeEnumMap, json['chatType']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$DilemmaChatModelImplToJson(
        _$DilemmaChatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sendTime': instance.sendTime.toIso8601String(),
      'userId': instance.userId,
      'userName': instance.userName,
      'chatType': _$ChatTypeEnumMap[instance.chatType]!,
      'message': instance.message,
    };

const _$ChatTypeEnumMap = {
  ChatType.text: 'text',
  ChatType.image: 'image',
};
