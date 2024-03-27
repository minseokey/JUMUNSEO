import 'package:freezed_annotation/freezed_annotation.dart';
import 'room_model.dart';

part 'chat_model.g.dart';
part 'chat_model.freezed.dart';

@freezed
class ChatParser with _$ChatParser{
  factory ChatParser(
      {required List<RoomParser> chats}) = _ChatParser;

  factory ChatParser.fromJson(Map<String, dynamic> json) =>
    _$ChatParserFromJson(json);
}