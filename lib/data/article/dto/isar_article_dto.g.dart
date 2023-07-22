// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_article_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarArticleDtoCollection on Isar {
  IsarCollection<IsarArticleDto> get isarArticleDtos => this.collection();
}

const IsarArticleDtoSchema = CollectionSchema(
  name: r'Article',
  id: 9049022761614856892,
  properties: {
    r'body': PropertySchema(
      id: 0,
      name: r'body',
      type: IsarType.string,
    ),
    r'categories': PropertySchema(
      id: 1,
      name: r'categories',
      type: IsarType.objectList,
      target: r'IsarCategoryDto',
    ),
    r'concepts': PropertySchema(
      id: 2,
      name: r'concepts',
      type: IsarType.objectList,
      target: r'IsarConceptsDto',
    ),
    r'dateTime': PropertySchema(
      id: 3,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'image': PropertySchema(
      id: 4,
      name: r'image',
      type: IsarType.string,
    ),
    r'isDuplicate': PropertySchema(
      id: 5,
      name: r'isDuplicate',
      type: IsarType.bool,
    ),
    r'lang': PropertySchema(
      id: 6,
      name: r'lang',
      type: IsarType.string,
    ),
    r'sourceId': PropertySchema(
      id: 7,
      name: r'sourceId',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 8,
      name: r'title',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 9,
      name: r'url',
      type: IsarType.string,
    ),
    r'uuid': PropertySchema(
      id: 10,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _isarArticleDtoEstimateSize,
  serialize: _isarArticleDtoSerialize,
  deserialize: _isarArticleDtoDeserialize,
  deserializeProp: _isarArticleDtoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'IsarConceptsDto': IsarConceptsDtoSchema,
    r'IsarCategoryDto': IsarCategoryDtoSchema
  },
  getId: _isarArticleDtoGetId,
  getLinks: _isarArticleDtoGetLinks,
  attach: _isarArticleDtoAttach,
  version: '3.1.0+1',
);

int _isarArticleDtoEstimateSize(
  IsarArticleDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.body.length * 3;
  bytesCount += 3 + object.categories.length * 3;
  {
    final offsets = allOffsets[IsarCategoryDto]!;
    for (var i = 0; i < object.categories.length; i++) {
      final value = object.categories[i];
      bytesCount +=
          IsarCategoryDtoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.concepts.length * 3;
  {
    final offsets = allOffsets[IsarConceptsDto]!;
    for (var i = 0; i < object.concepts.length; i++) {
      final value = object.concepts[i];
      bytesCount +=
          IsarConceptsDtoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lang;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.url.length * 3;
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _isarArticleDtoSerialize(
  IsarArticleDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.body);
  writer.writeObjectList<IsarCategoryDto>(
    offsets[1],
    allOffsets,
    IsarCategoryDtoSchema.serialize,
    object.categories,
  );
  writer.writeObjectList<IsarConceptsDto>(
    offsets[2],
    allOffsets,
    IsarConceptsDtoSchema.serialize,
    object.concepts,
  );
  writer.writeDateTime(offsets[3], object.dateTime);
  writer.writeString(offsets[4], object.image);
  writer.writeBool(offsets[5], object.isDuplicate);
  writer.writeString(offsets[6], object.lang);
  writer.writeLong(offsets[7], object.sourceId);
  writer.writeString(offsets[8], object.title);
  writer.writeString(offsets[9], object.url);
  writer.writeString(offsets[10], object.uuid);
}

IsarArticleDto _isarArticleDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarArticleDto(
    body: reader.readString(offsets[0]),
    categories: reader.readObjectList<IsarCategoryDto>(
          offsets[1],
          IsarCategoryDtoSchema.deserialize,
          allOffsets,
          IsarCategoryDto(),
        ) ??
        const [],
    concepts: reader.readObjectList<IsarConceptsDto>(
          offsets[2],
          IsarConceptsDtoSchema.deserialize,
          allOffsets,
          IsarConceptsDto(),
        ) ??
        const [],
    dateTime: reader.readDateTimeOrNull(offsets[3]),
    id: id,
    image: reader.readStringOrNull(offsets[4]),
    isDuplicate: reader.readBoolOrNull(offsets[5]) ?? false,
    lang: reader.readStringOrNull(offsets[6]),
    sourceId: reader.readLong(offsets[7]),
    title: reader.readString(offsets[8]),
    url: reader.readString(offsets[9]),
    uuid: reader.readString(offsets[10]),
  );
  return object;
}

P _isarArticleDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectList<IsarCategoryDto>(
            offset,
            IsarCategoryDtoSchema.deserialize,
            allOffsets,
            IsarCategoryDto(),
          ) ??
          const []) as P;
    case 2:
      return (reader.readObjectList<IsarConceptsDto>(
            offset,
            IsarConceptsDtoSchema.deserialize,
            allOffsets,
            IsarConceptsDto(),
          ) ??
          const []) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarArticleDtoGetId(IsarArticleDto object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarArticleDtoGetLinks(IsarArticleDto object) {
  return [];
}

void _isarArticleDtoAttach(
    IsarCollection<dynamic> col, Id id, IsarArticleDto object) {}

extension IsarArticleDtoQueryWhereSort
    on QueryBuilder<IsarArticleDto, IsarArticleDto, QWhere> {
  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarArticleDtoQueryWhere
    on QueryBuilder<IsarArticleDto, IsarArticleDto, QWhereClause> {
  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarArticleDtoQueryFilter
    on QueryBuilder<IsarArticleDto, IsarArticleDto, QFilterCondition> {
  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      bodyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      bodyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      bodyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      bodyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'body',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      bodyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      bodyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      bodyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      bodyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'body',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      bodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      bodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      categoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      categoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      categoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      conceptsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concepts',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      conceptsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concepts',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      conceptsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concepts',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      conceptsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concepts',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      conceptsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concepts',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      conceptsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concepts',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      dateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateTime',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      dateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateTime',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      dateTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      dateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      dateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      dateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      isDuplicateEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDuplicate',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lang',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lang',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lang',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lang',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lang',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lang',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lang',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lang',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lang',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lang',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lang',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      langIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lang',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      sourceIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      sourceIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      sourceIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      sourceIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      urlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      urlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      uuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      uuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      uuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension IsarArticleDtoQueryObject
    on QueryBuilder<IsarArticleDto, IsarArticleDto, QFilterCondition> {
  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      categoriesElement(FilterQuery<IsarCategoryDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'categories');
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterFilterCondition>
      conceptsElement(FilterQuery<IsarConceptsDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'concepts');
    });
  }
}

extension IsarArticleDtoQueryLinks
    on QueryBuilder<IsarArticleDto, IsarArticleDto, QFilterCondition> {}

extension IsarArticleDtoQuerySortBy
    on QueryBuilder<IsarArticleDto, IsarArticleDto, QSortBy> {
  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy>
      sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy>
      sortByIsDuplicate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDuplicate', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy>
      sortByIsDuplicateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDuplicate', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByLang() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lang', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByLangDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lang', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy>
      sortBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension IsarArticleDtoQuerySortThenBy
    on QueryBuilder<IsarArticleDto, IsarArticleDto, QSortThenBy> {
  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy>
      thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy>
      thenByIsDuplicate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDuplicate', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy>
      thenByIsDuplicateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDuplicate', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByLang() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lang', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByLangDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lang', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy>
      thenBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension IsarArticleDtoQueryWhereDistinct
    on QueryBuilder<IsarArticleDto, IsarArticleDto, QDistinct> {
  QueryBuilder<IsarArticleDto, IsarArticleDto, QDistinct> distinctByBody(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'body', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QDistinct> distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QDistinct>
      distinctByIsDuplicate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDuplicate');
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QDistinct> distinctByLang(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lang', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QDistinct> distinctBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceId');
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarArticleDto, IsarArticleDto, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension IsarArticleDtoQueryProperty
    on QueryBuilder<IsarArticleDto, IsarArticleDto, QQueryProperty> {
  QueryBuilder<IsarArticleDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarArticleDto, String, QQueryOperations> bodyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'body');
    });
  }

  QueryBuilder<IsarArticleDto, List<IsarCategoryDto>, QQueryOperations>
      categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categories');
    });
  }

  QueryBuilder<IsarArticleDto, List<IsarConceptsDto>, QQueryOperations>
      conceptsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'concepts');
    });
  }

  QueryBuilder<IsarArticleDto, DateTime?, QQueryOperations> dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<IsarArticleDto, String?, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<IsarArticleDto, bool, QQueryOperations> isDuplicateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDuplicate');
    });
  }

  QueryBuilder<IsarArticleDto, String?, QQueryOperations> langProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lang');
    });
  }

  QueryBuilder<IsarArticleDto, int, QQueryOperations> sourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceId');
    });
  }

  QueryBuilder<IsarArticleDto, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<IsarArticleDto, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }

  QueryBuilder<IsarArticleDto, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarConceptsDtoSchema = Schema(
  name: r'IsarConceptsDto',
  id: 8138302736576614284,
  properties: {
    r'label': PropertySchema(
      id: 0,
      name: r'label',
      type: IsarType.string,
    ),
    r'score': PropertySchema(
      id: 1,
      name: r'score',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 2,
      name: r'type',
      type: IsarType.string,
    ),
    r'uri': PropertySchema(
      id: 3,
      name: r'uri',
      type: IsarType.string,
    )
  },
  estimateSize: _isarConceptsDtoEstimateSize,
  serialize: _isarConceptsDtoSerialize,
  deserialize: _isarConceptsDtoDeserialize,
  deserializeProp: _isarConceptsDtoDeserializeProp,
);

int _isarConceptsDtoEstimateSize(
  IsarConceptsDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uri;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarConceptsDtoSerialize(
  IsarConceptsDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.label);
  writer.writeLong(offsets[1], object.score);
  writer.writeString(offsets[2], object.type);
  writer.writeString(offsets[3], object.uri);
}

IsarConceptsDto _isarConceptsDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarConceptsDto(
    label: reader.readStringOrNull(offsets[0]),
    score: reader.readLongOrNull(offsets[1]),
    type: reader.readStringOrNull(offsets[2]),
    uri: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _isarConceptsDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarConceptsDtoQueryFilter
    on QueryBuilder<IsarConceptsDto, IsarConceptsDto, QFilterCondition> {
  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      scoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      scoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      scoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      scoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      scoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      scoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uri',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uri',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uri',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uri',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uri',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarConceptsDto, IsarConceptsDto, QAfterFilterCondition>
      uriIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uri',
        value: '',
      ));
    });
  }
}

extension IsarConceptsDtoQueryObject
    on QueryBuilder<IsarConceptsDto, IsarConceptsDto, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarCategoryDtoSchema = Schema(
  name: r'IsarCategoryDto',
  id: 6104904340094093129,
  properties: {
    r'label': PropertySchema(
      id: 0,
      name: r'label',
      type: IsarType.string,
    ),
    r'uri': PropertySchema(
      id: 1,
      name: r'uri',
      type: IsarType.string,
    ),
    r'wgt': PropertySchema(
      id: 2,
      name: r'wgt',
      type: IsarType.long,
    )
  },
  estimateSize: _isarCategoryDtoEstimateSize,
  serialize: _isarCategoryDtoSerialize,
  deserialize: _isarCategoryDtoDeserialize,
  deserializeProp: _isarCategoryDtoDeserializeProp,
);

int _isarCategoryDtoEstimateSize(
  IsarCategoryDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uri;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarCategoryDtoSerialize(
  IsarCategoryDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.label);
  writer.writeString(offsets[1], object.uri);
  writer.writeLong(offsets[2], object.wgt);
}

IsarCategoryDto _isarCategoryDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarCategoryDto(
    label: reader.readStringOrNull(offsets[0]),
    uri: reader.readStringOrNull(offsets[1]),
    wgt: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _isarCategoryDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarCategoryDtoQueryFilter
    on QueryBuilder<IsarCategoryDto, IsarCategoryDto, QFilterCondition> {
  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uri',
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uri',
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uri',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uri',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uri',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      uriIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uri',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      wgtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wgt',
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      wgtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wgt',
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      wgtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wgt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      wgtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wgt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      wgtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wgt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCategoryDto, IsarCategoryDto, QAfterFilterCondition>
      wgtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wgt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarCategoryDtoQueryObject
    on QueryBuilder<IsarCategoryDto, IsarCategoryDto, QFilterCondition> {}
