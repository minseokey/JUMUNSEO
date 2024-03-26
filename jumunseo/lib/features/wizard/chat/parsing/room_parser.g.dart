// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_parser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomParserImpl _$$RoomParserImplFromJson(Map<String, dynamic> json) =>
    _$RoomParserImpl(
      id: json['_id'] as String,
      start_time: json['start_time'] as String,
      user_id: json['user_id'] as String,
      room_id: json['room_id'] as String,
      added_prompt: json['added_prompt'] as String,
      conversation: (json['conversation'] as List<dynamic>)
          .map((e) => ConversationParser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RoomParserImplToJson(_$RoomParserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'start_time': instance.start_time,
      'user_id': instance.user_id,
      'room_id': instance.room_id,
      'added_prompt': instance.added_prompt,
      'conversation': instance.conversation,
    };
