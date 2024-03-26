import 'package:jumunseo/features/wizard/chat/parsing/conversation_parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_parser.g.dart';
part 'room_parser.freezed.dart';

@freezed
class RoomParser with _$RoomParser{
  factory RoomParser(
      {required String id,
      required String start_time,
      required String user_id,
      required String room_id,
      required String added_prompt,
      required List<ConversationParser> conversation}) = _RoomParser;

  factory RoomParser.fromJson(Map<String, dynamic> json) =>
    _$RoomParserFromJson(json);
}