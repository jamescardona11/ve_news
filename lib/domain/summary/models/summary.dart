import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:ve_news/domain/article/article_model.dart';

import 'article_resume_model.dart';

class SummaryArticles extends Equatable {
  final int? id;
  final String? name;
  final List<ArticleModel> articles;
  final List<ArticleResumeModel> resumeArticles;
  final bool isCompleted;
  final bool isCreatingVoiceSummary;
  final int summaryPercentage;

  final LanguageEnum language;

  const SummaryArticles({
    this.id,
    this.name,
    this.articles = const [],
    this.resumeArticles = const [],
    this.isCompleted = false,
    this.isCreatingVoiceSummary = false,
    this.summaryPercentage = 70,
    this.language = LanguageEnum.en,
  });

  static const int _time = 833;

  bool get isNotEmpty => articles.isNotEmpty;
  List<Category> get categories => articles.map((e) => e.categories.isNotEmpty ? e.categories.first : null).whereNotNull().toSet().toList();

  int get length => articles.length;
  int get bodyLength => articles.map((e) => e.body.length).fold(0, (previousValue, element) => previousValue + element);

  String get summaryStr => '${(bodyLength * summaryPercentage) ~/ 100}';
  String get summaryTimeStr => '~${(bodyLength / _time).toStringAsFixed(0)} min';

  List<ArticleModel> get uncompletedTextArticles => articles
      .where((article) => resumeArticles.where((resume) => resume.articleId == article.uuid && resume.content?.isNotEmpty == true).isEmpty)
      .toList();

  List<ArticleResumeModel> get uncompletedVoiceSummaries => resumeArticles.where((resume) => resume.path?.isNotEmpty != true).toList();

  bool get textCompleted => resumeArticles.length >= articles.length;

  SummaryArticles copyWith({
    int? id,
    String? name,
    List<ArticleModel>? articles,
    List<ArticleResumeModel>? resumeArticles,
    bool? isCompleted,
    bool? isCreatingVoiceSummary,
    int? summaryPercentage,
    String? voiceSummaryPath,
    LanguageEnum? language,
  }) {
    return SummaryArticles(
      id: id ?? this.id,
      name: name ?? this.name,
      articles: articles ?? this.articles,
      resumeArticles: resumeArticles ?? this.resumeArticles,
      isCompleted: isCompleted ?? this.isCompleted,
      isCreatingVoiceSummary: isCreatingVoiceSummary ?? this.isCreatingVoiceSummary,
      summaryPercentage: summaryPercentage ?? this.summaryPercentage,
      language: language ?? this.language,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        articles,
        resumeArticles,
        isCompleted,
        isCreatingVoiceSummary,
        summaryPercentage,
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

  String get withEmoji =>
      {
        LanguageEnum.en: '🇺🇸 English',
        LanguageEnum.fr: '🇫🇷 French',
        LanguageEnum.es: '🇪🇸 Spanish',
        LanguageEnum.de: '🇩🇪 German',
        LanguageEnum.it: '🇮🇹 Italian',
        LanguageEnum.pt: '🇵🇹 Portuguese',
      }[this] ??
      '';
}

extension LanguageEnumX on LanguageEnum {
  static LanguageEnum? fromValue(String? value) {
    return LanguageEnum.values.firstWhereOrNull((element) => element.value == value);
  }
}
