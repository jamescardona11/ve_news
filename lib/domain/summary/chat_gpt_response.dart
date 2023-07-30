class ChatGptResponse {
  final String id;
  final DateTime created;
  final ChatGptUsage? usage;
  final List<ChatGptChoices> choices;

  const ChatGptResponse({
    required this.id,
    required this.created,
    this.choices = const [],
    this.usage,
  });

  bool get isEmpty => choices.isEmpty;
  String get content => !isEmpty ? choices.first.message : '';
}

class ChatGptUsage {
  final int promptTokens;
  final int completionTokens;

  ChatGptUsage({
    required this.promptTokens,
    required this.completionTokens,
  });
}

class ChatGptChoices {
  final int index;
  final String finishReason;
  final String message;

  ChatGptChoices({
    required this.index,
    this.finishReason = '',
    this.message = '',
  });
}
