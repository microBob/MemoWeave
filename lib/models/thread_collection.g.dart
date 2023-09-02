// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetThreadCollectionCollection on Isar {
  IsarCollection<ThreadCollection> get threadCollections => this.collection();
}

const ThreadCollectionSchema = CollectionSchema(
  name: r'ThreadCollection',
  id: -1191098789140832712,
  properties: {
    r'blockIds': PropertySchema(
      id: 0,
      name: r'blockIds',
      type: IsarType.longList,
    ),
    r'dateTime': PropertySchema(
      id: 1,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'spool': PropertySchema(
      id: 2,
      name: r'spool',
      type: IsarType.string,
    ),
    r'subject': PropertySchema(
      id: 3,
      name: r'subject',
      type: IsarType.string,
    )
  },
  estimateSize: _threadCollectionEstimateSize,
  serialize: _threadCollectionSerialize,
  deserialize: _threadCollectionDeserialize,
  deserializeProp: _threadCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _threadCollectionGetId,
  getLinks: _threadCollectionGetLinks,
  attach: _threadCollectionAttach,
  version: '3.1.0+1',
);

int _threadCollectionEstimateSize(
  ThreadCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.blockIds.length * 8;
  bytesCount += 3 + object.spool.length * 3;
  bytesCount += 3 + object.subject.length * 3;
  return bytesCount;
}

void _threadCollectionSerialize(
  ThreadCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.blockIds);
  writer.writeDateTime(offsets[1], object.dateTime);
  writer.writeString(offsets[2], object.spool);
  writer.writeString(offsets[3], object.subject);
}

ThreadCollection _threadCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ThreadCollection(
    blockIds: reader.readLongList(offsets[0]) ?? const [1, 2, 3],
    dateTime: reader.readDateTime(offsets[1]),
    spool: reader.readStringOrNull(offsets[2]) ?? '',
    subject: reader.readStringOrNull(offsets[3]) ?? '',
  );
  return object;
}

P _threadCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? const [1, 2, 3]) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _threadCollectionGetId(ThreadCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _threadCollectionGetLinks(ThreadCollection object) {
  return [];
}

void _threadCollectionAttach(
    IsarCollection<dynamic> col, Id id, ThreadCollection object) {}

extension ThreadCollectionQueryWhereSort
    on QueryBuilder<ThreadCollection, ThreadCollection, QWhere> {
  QueryBuilder<ThreadCollection, ThreadCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ThreadCollectionQueryWhere
    on QueryBuilder<ThreadCollection, ThreadCollection, QWhereClause> {
  QueryBuilder<ThreadCollection, ThreadCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterWhereClause> idBetween(
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

extension ThreadCollectionQueryFilter
    on QueryBuilder<ThreadCollection, ThreadCollection, QFilterCondition> {
  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      blockIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockIds',
        value: value,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      blockIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockIds',
        value: value,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      blockIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockIds',
        value: value,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      blockIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      blockIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      blockIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      blockIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      blockIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      blockIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      blockIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      dateTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      dateTimeGreaterThan(
    DateTime value, {
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

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      dateTimeLessThan(
    DateTime value, {
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

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      dateTimeBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
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

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
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

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      spoolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'spool',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      spoolGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'spool',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      spoolLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'spool',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      spoolBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'spool',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      spoolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'spool',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      spoolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'spool',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      spoolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'spool',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      spoolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'spool',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      spoolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'spool',
        value: '',
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      spoolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'spool',
        value: '',
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      subjectEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      subjectGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      subjectLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      subjectBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subject',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      subjectStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      subjectEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      subjectContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      subjectMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subject',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      subjectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subject',
        value: '',
      ));
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterFilterCondition>
      subjectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subject',
        value: '',
      ));
    });
  }
}

extension ThreadCollectionQueryObject
    on QueryBuilder<ThreadCollection, ThreadCollection, QFilterCondition> {}

extension ThreadCollectionQueryLinks
    on QueryBuilder<ThreadCollection, ThreadCollection, QFilterCondition> {}

extension ThreadCollectionQuerySortBy
    on QueryBuilder<ThreadCollection, ThreadCollection, QSortBy> {
  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy>
      sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy>
      sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy> sortBySpool() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spool', Sort.asc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy>
      sortBySpoolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spool', Sort.desc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy>
      sortBySubject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.asc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy>
      sortBySubjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.desc);
    });
  }
}

extension ThreadCollectionQuerySortThenBy
    on QueryBuilder<ThreadCollection, ThreadCollection, QSortThenBy> {
  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy>
      thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy>
      thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy> thenBySpool() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spool', Sort.asc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy>
      thenBySpoolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spool', Sort.desc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy>
      thenBySubject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.asc);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QAfterSortBy>
      thenBySubjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.desc);
    });
  }
}

extension ThreadCollectionQueryWhereDistinct
    on QueryBuilder<ThreadCollection, ThreadCollection, QDistinct> {
  QueryBuilder<ThreadCollection, ThreadCollection, QDistinct>
      distinctByBlockIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockIds');
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QDistinct>
      distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QDistinct> distinctBySpool(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'spool', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ThreadCollection, ThreadCollection, QDistinct> distinctBySubject(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subject', caseSensitive: caseSensitive);
    });
  }
}

extension ThreadCollectionQueryProperty
    on QueryBuilder<ThreadCollection, ThreadCollection, QQueryProperty> {
  QueryBuilder<ThreadCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ThreadCollection, List<int>, QQueryOperations>
      blockIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockIds');
    });
  }

  QueryBuilder<ThreadCollection, DateTime, QQueryOperations>
      dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<ThreadCollection, String, QQueryOperations> spoolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'spool');
    });
  }

  QueryBuilder<ThreadCollection, String, QQueryOperations> subjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subject');
    });
  }
}
