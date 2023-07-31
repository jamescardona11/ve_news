// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ArticleResumeModel extends Equatable {
  final String? articleId;
  final String? content;
  final String? path;
  final String lang;

  const ArticleResumeModel({
    this.lang = 'English',
    required this.articleId,
    required this.content,
    this.path,
  });

  ArticleResumeModel copyWith({
    String? articleId,
    String? content,
    String? path,
    String? lang,
  }) {
    return ArticleResumeModel(
      articleId: articleId ?? this.articleId,
      content: content ?? this.content,
      path: path ?? this.path,
      lang: lang ?? this.lang,
    );
  }

  @override
  List<Object?> get props => [articleId, content, path, lang];
}
