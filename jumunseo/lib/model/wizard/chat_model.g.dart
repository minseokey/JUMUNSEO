// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatParserImpl _$$ChatParserImplFromJson(Map<String, dynamic> json) =>
    _$ChatParserImpl(
      chats: (json['chats'] as List<dynamic>)
          .map((e) => RoomParser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatParserImplToJson(_$ChatParserImpl instance) =>
    <String, dynamic>{
      'chats': instance.chats,
    };
