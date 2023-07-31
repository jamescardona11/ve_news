class ChatGptRequest {
  final String model;
  final List<ChatGptContentMessage> messages;
  final int? maxTokens;
  final double? temperature;

  ChatGptRequest({
    this.model = 'gpt-3.5-turbo',
    required this.messages,
    this.maxTokens,
    this.temperature,
  });
}

class ChatGptContentMessage {
  final String content;
  final ChatGptRole role;

  ChatGptContentMessage({
    required this.content,
    required this.role,
  });
}

enum ChatGptRole {
  user,
  system,
}
