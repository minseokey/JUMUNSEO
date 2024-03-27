import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_model.g.dart';
part 'conversation_model.freezed.dart';

@freezed
class ConversationParser with _$ConversationParser{
  factory ConversationParser(
      {required String user_message,
      required String bot_response}) = _ConversationParser;

  factory ConversationParser.fromJson(Map<String, dynamic> json) =>
    _$ConversationParserFromJson(json);
}