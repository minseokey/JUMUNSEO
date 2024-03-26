import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_parser.g.dart';
part 'conversation_parser.freezed.dart';

@freezed
class ConversationParser with _$ConversationParser{
  factory ConversationParser(
      {required String userMessage,
      required String botResponse}) = _ConversationParser;

  factory ConversationParser.fromJson(Map<String, dynamic> json) =>
    _$ConversationParserFromJson(json);
}