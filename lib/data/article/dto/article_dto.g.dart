// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDto _$ArticleDtoFromJson(Map<String, dynamic> json) => ArticleDto(
      uuid: json['uri'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      body: json['body'] as String,
      isDuplicate: json['isDuplicate'] as bool? ?? false,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      lang: json['lang'] as String?,
      image: json['image'] as String?,
      sourceUri:
          ArticleDto._sourceFromJson(json['source'] as Map<String, dynamic>?),
      concepts: (json['concepts'] as List<dynamic>?)
              ?.map((e) => ConceptsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ArticleDtoToJson(ArticleDto instance) =>
    <String, dynamic>{
      'uri': instance.uuid,
      'title': instance.title,
      'url': instance.url,
      'body': instance.body,
      'isDuplicate': instance.isDuplicate,
      'dateTime': instance.dateTime?.toIso8601String(),
      'lang': instance.lang,
      'image': instance.image,
      'source': instance.sourceUri,
      'concepts': instance.concepts.map((e) => e.toJson()).toList(),
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };

ConceptsDto _$ConceptsDtoFromJson(Map<String, dynamic> json) => ConceptsDto(
      uri: json['uri'] as String?,
      type: json['type'] as String?,
      score: json['score'] as int?,
      label: ConceptsDto._labelFromJson(json['label'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$ConceptsDtoToJson(ConceptsDto instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'type': instance.type,
      'score': instance.score,
      'label': instance.label,
    };

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
      uri: json['uri'] as String?,
      wgt: json['wgt'] as int?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'wgt': instance.wgt,
      'label': instance.label,
    };
