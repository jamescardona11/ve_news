import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/summary/article_resume_model.dart';

class SummaryArticles extends Equatable {
  final int? id;
  final List<ArticleModel> articles;
  final List<ArticleResumeModel> resumeArticles;
  final bool isCompleted;
  final bool isCreatingVoiceSummary;
  final int summaryPercentage;
  final String? voiceSummaryPath;
  final LanguageEnum language;

  const SummaryArticles({
    this.id,
    this.articles = const [],
    this.resumeArticles = const [],
    this.isCompleted = false,
    this.isCreatingVoiceSummary = false,
    this.summaryPercentage = 70,
    this.voiceSummaryPath,
    this.language = LanguageEnum.en,
  });

  bool get isEmpty => articles.isEmpty;
  bool get isNotEmpty => articles.isNotEmpty;
  List<Category> get categories => articles.map((e) => e.categories.isNotEmpty ? e.categories.first : null).whereNotNull().toSet().toList();

  int get length => articles.length;
  int get bodyLength => articles.map((e) => e.body.length).fold(0, (previousValue, element) => previousValue + element);

  String get summaryStr => '${(bodyLength * summaryPercentage) ~/ 100}';
  String get summaryTimeStr => '~${(bodyLength / _time).toStringAsFixed(0)} min';

  static const int _time = 833;

  SummaryArticles copyWith({
    int? id,
    List<ArticleModel>? articles,
    bool? isCompleted,
    bool? isCreatingVoiceSummary,
    int? summaryPercentage,
    String? voiceSummaryPath,
  }) {
    return SummaryArticles(
      id: id ?? this.id,
      articles: articles ?? this.articles,
      isCompleted: isCompleted ?? this.isCompleted,
      isCreatingVoiceSummary: isCreatingVoiceSummary ?? this.isCreatingVoiceSummary,
      summaryPercentage: summaryPercentage ?? this.summaryPercentage,
      voiceSummaryPath: voiceSummaryPath ?? this.voiceSummaryPath,
    );
  }

  @override
  List<Object?> get props => [
        id,
        articles,
        resumeArticles,
        isCompleted,
        isCreatingVoiceSummary,
        summaryPercentage,
        voiceSummaryPath,
        language,
      ];
}

enum LanguageEnum {
  en('English'),
  fr('French'),
  es('Spanish'),
  de('German'),
  it('Italian'),
  pt('Portuguese');

  final String value;

  const LanguageEnum(this.value);
}
