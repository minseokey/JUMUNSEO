// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_parser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationParserImpl _$$ConversationParserImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationParserImpl(
      user_message: json['user_message'] as String,
      bot_response: json['bot_response'] as String,
    );

Map<String, dynamic> _$$ConversationParserImplToJson(
        _$ConversationParserImpl instance) =>
    <String, dynamic>{
      'user_message': instance.user_message,
      'bot_response': instance.bot_response,
    };
