import 'package:equatable/equatable.dart';
import 'package:ve_news/domain/source/source_model.dart';

class ArticleModel extends Equatable {
  final String uuid;
  final String title;
  final String url;
  final String body;
  final SourceModel source;
  final bool isDuplicate;
  final DateTime? dateTime;
  final String? lang;
  final String? image;
  final List<Concepts> concepts;
  final List<Category> categories;

  const ArticleModel({
    required this.uuid,
    required this.title,
    required this.url,
    required this.body,
    required this.source,
    this.isDuplicate = false,
    this.dateTime,
    this.lang,
    this.image,
    this.concepts = const [],
    this.categories = const [],
  });

  String get category {
    if (categories.isEmpty) return 'News';

    for (var c in categories) {
      final s = c.label!.split('/').last;
      if (s.split(' ').length <= 2) {
        return s;
      }
    }

    return categories.first.label!.split('/').last;
  }

  @override
  List<Object?> get props {
    return [
      uuid,
      title,
      url,
      body,
      source,
      isDuplicate,
      dateTime,
      lang,
      image,
      concepts,
      categories,
    ];
  }
}

class Concepts extends Equatable {
  final String? uri;
  final String? type;
  final int? score;
  final String? label;

  const Concepts({this.uri, this.type, this.score, this.label});

  @override
  List<Object?> get props => [uri, type, score, label];
}

class Category extends Equatable {
  final String? uri;
  final int? wgt;
  final String? label;

  const Category({this.uri, this.wgt, this.label});

  @override
  List<Object?> get props => [uri, wgt, label];
}
