import 'package:jumunseo/features/wizard/chat/parsing/conversation_parser.dart';

class RoomParser {
  final String id;
  final String startTime;
  final String userId;
  final String roomId;
  final String addedPrompt;
  final List<ConversationParser> conversation;

  RoomParser(
      {required this.id,
      required this.startTime,
      required this.userId,
      required this.roomId,
      required this.addedPrompt,
      required this.conversation});

  factory RoomParser.fromJson(Map<String, dynamic> json) {
    return RoomParser(
      id: json["_id"],
      startTime: json["start_time"],
      userId: json["user_id"],
      roomId: json["room_id"],
      addedPrompt: json["added_prompt"],
      conversation: json["conversation"],
    );
  }
}