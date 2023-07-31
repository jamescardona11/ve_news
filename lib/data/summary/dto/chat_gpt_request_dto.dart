import 'package:json_annotation/json_annotation.dart';
import 'package:ve_news/domain/summary/export_summary.dart';

part 'chat_gpt_request_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ChatGptRequestDto {
  final String model;
  final List<ChatGptContentMessageDto> messages;
  final int? maxTokens;
  final double? temperature;

  const ChatGptRequestDto({
    this.model = 'gpt-3.5-turbo',
    required this.messages,
    this.maxTokens,
    this.temperature,
  });

  bool get isEmpty => messages.isEmpty;

  factory ChatGptRequestDto.fromDomain(ChatGptRequest model) => ChatGptRequestDto(
        model: model.model,
        messages: model.messages.map(ChatGptContentMessageDto.fromDomain).toList(),
        maxTokens: model.maxTokens,
        temperature: model.temperature,
      );

  Map<String, dynamic> toJson() => _$ChatGptRequestDtoToJson(this);
  factory ChatGptRequestDto.fromJson(Map<String, dynamic> json) => _$ChatGptRequestDtoFromJson(json);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ChatGptContentMessageDto {
  final String content;
  final ChatGptRole role;

  const ChatGptContentMessageDto({
    required this.content,
    required this.role,
  });

  factory ChatGptContentMessageDto.fromDomain(ChatGptContentMessage model) => ChatGptContentMessageDto(
        content: model.content,
        role: model.role,
      );

  Map<String, dynamic> toJson() => _$ChatGptContentMessageDtoToJson(this);
  factory ChatGptContentMessageDto.fromJson(Map<String, dynamic> json) => _$ChatGptContentMessageDtoFromJson(json);
}
