// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_parser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomParserImpl _$$RoomParserImplFromJson(Map<String, dynamic> json) =>
    _$RoomParserImpl(
      id: json['id'] as String,
      startTime: json['startTime'] as String,
      userId: json['userId'] as String,
      roomId: json['roomId'] as String,
      addedPrompt: json['addedPrompt'] as String,
      conversation: (json['conversation'] as List<dynamic>)
          .map((e) => ConversationParser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RoomParserImplToJson(_$RoomParserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime,
      'userId': instance.userId,
      'roomId': instance.roomId,
      'addedPrompt': instance.addedPrompt,
      'conversation': instance.conversation,
    };
