import 'package:jumunseo/features/wizard/chat/parsing/room_parser.dart';

class ChatParser {
  final List<RoomParser> chats;

  ChatParser(
      {required this.chats});

  factory ChatParser.fromJson(Map<String, dynamic> json) {
    return ChatParser(
      chats: json["chats"],
    );
  }
}