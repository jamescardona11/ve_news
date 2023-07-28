import 'package:equatable/equatable.dart';

class SummaryArticles extends Equatable {
  final int id;
  final Set<String> articles;
  final bool isCompleted;
  final bool isCreatingVoiceSummary;
  final String? voiceSummaryPath;

  const SummaryArticles({
    this.id = -1,
    this.articles = const {},
    this.isCompleted = false,
    this.isCreatingVoiceSummary = false,
    this.voiceSummaryPath,
  });

  @override
  List<Object?> get props => [
        id,
        articles,
      ];
}
