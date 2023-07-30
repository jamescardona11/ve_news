import 'package:json_annotation/json_annotation.dart';
import 'package:ve_news/domain/summary/chat_gpt_response.dart';

part 'chat_gpt_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class ChatGptResponseDto {
  final String id;
  @JsonKey(fromJson: _fromCreatedJson)
  final DateTime created;

  final ChatGptUsageDto? usage;
  final List<ChatGptChoicesDto> choices;

  const ChatGptResponseDto({
    required this.id,
    required this.created,
    this.choices = const [],
    this.usage,
  });

  ChatGptResponse toDomain() => ChatGptResponse(
        id: id,
        created: created,
        choices: choices.map((e) => e.toDomain()).toList(),
        usage: usage != null ? usage!.toDomain() : null,
      );

  factory ChatGptResponseDto.fromJson(Map<String, dynamic> json) => _$ChatGptResponseDtoFromJson(json);

  static DateTime _fromCreatedJson(int created) {
    return DateTime.fromMillisecondsSinceEpoch(created * 1000);
  }
}

@JsonSerializable(createToJson: false)
class ChatGptUsageDto {
  @JsonKey(name: 'prompt_tokens')
  final int promptTokens;

  @JsonKey(name: 'completion_tokens')
  final int completionTokens;

  const ChatGptUsageDto({
    required this.promptTokens,
    required this.completionTokens,
  });

  ChatGptUsage toDomain() => ChatGptUsage(
        promptTokens: promptTokens,
        completionTokens: completionTokens,
      );

  factory ChatGptUsageDto.fromJson(Map<String, dynamic> json) => _$ChatGptUsageDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class ChatGptChoicesDto {
  final int index;

  @JsonKey(name: 'finish_reason')
  final String finishReason;

  @JsonKey(fromJson: _fromMessageJson)
  final String message;

  const ChatGptChoicesDto({
    required this.index,
    this.finishReason = '',
    this.message = '',
  });

  ChatGptChoices toDomain() => ChatGptChoices(
        index: index,
        finishReason: finishReason,
        message: message,
      );

  factory ChatGptChoicesDto.fromJson(Map<String, dynamic> json) => _$ChatGptChoicesDtoFromJson(json);

  static String _fromMessageJson(dynamic message) {
    if (message is! Map<String, dynamic>) return '';
    return message['content'] ?? '';
  }
}
