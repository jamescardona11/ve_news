import 'package:equatable/equatable.dart';
import 'package:ve_news/domain/source/source_model.dart';

class ArticleModel extends Equatable {
  final int? id;
  final String uuid;
  final String title;
  final String url;
  final String body;
  final SourceModel source;
  final bool isDuplicate;
  final bool bookmark;
  final DateTime? dateTime;
  final String? lang;
  final String? image;
  final List<Concepts> concepts;
  final List<Category> categories;

  const ArticleModel({
    this.id,
    required this.uuid,
    required this.title,
    required this.url,
    required this.body,
    required this.source,
    this.isDuplicate = false,
    this.bookmark = false,
    this.dateTime,
    this.lang,
    this.image,
    this.concepts = const [],
    this.categories = const [],
  });

  String summaryStr(int percentage) => '${(body.length * percentage) ~/ 100}';

  String get category {
    if (categories.isEmpty) return 'News';

    for (var c in categories) {
      final s = c.singleLabel;
      if (s.split(' ').length <= 2) {
        return s;
      }
    }

    return categories.first.label!.split('/').last;
  }

  ArticleModel copyWith({
    int? id,
    String? uuid,
    String? title,
    String? url,
    String? body,
    SourceModel? source,
    bool? isDuplicate,
    bool? bookmark,
    DateTime? dateTime,
    String? lang,
    String? image,
    List<Concepts>? concepts,
    List<Category>? categories,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      url: url ?? this.url,
      body: body ?? this.body,
      source: source ?? this.source,
      isDuplicate: isDuplicate ?? this.isDuplicate,
      bookmark: bookmark ?? this.bookmark,
      dateTime: dateTime ?? this.dateTime,
      lang: lang ?? this.lang,
      image: image ?? this.image,
      concepts: concepts ?? this.concepts,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      uuid,
      title,
      url,
      body,
      source,
      isDuplicate,
      bookmark,
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

  String get singleLabel {
    if (label?.isEmpty == true) return '';

    return label!.split('/').last;
  }

  @override
  List<Object?> get props => [uri, wgt, label];
}
