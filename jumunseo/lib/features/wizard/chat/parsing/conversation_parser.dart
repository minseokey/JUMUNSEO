class ConversationParser {
  final String userMessage;
  final String botResponse;

  ConversationParser(
      {required this.userMessage,
      required this.botResponse});

  factory ConversationParser.fromJson(Map<String, dynamic> json) {
    return ConversationParser(
      userMessage: json["user_message"],
      botResponse: json["bot_response"],
    );
  }
}