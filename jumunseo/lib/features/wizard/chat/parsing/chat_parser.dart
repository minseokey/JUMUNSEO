import 'package:jumunseo/features/wizard/chat/parsing/room_parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_parser.g.dart';
part 'chat_parser.freezed.dart';

@freezed
class ChatParser with _$ChatParser{
  factory ChatParser(
      {required List<RoomParser> chats}) = _ChatParser;

  factory ChatParser.fromJson(Map<String, dynamic> json) =>
    _$ChatParserFromJson(json);
}