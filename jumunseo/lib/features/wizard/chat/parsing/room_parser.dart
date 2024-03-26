import 'package:jumunseo/features/wizard/chat/parsing/conversation_parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_parser.g.dart';
part 'room_parser.freezed.dart';

@freezed
class RoomParser with _$RoomParser{
  factory RoomParser(
      {required String id,
      required String startTime,
      required String userId,
      required String roomId,
      required String addedPrompt,
      required List<ConversationParser> conversation}) = _RoomParser;

  factory RoomParser.fromJson(Map<String, dynamic> json) =>
    _$RoomParserFromJson(json);
}