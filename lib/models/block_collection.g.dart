// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBlockCollectionCollection on Isar {
  IsarCollection<BlockCollection> get blockCollections => this.collection();
}

const BlockCollectionSchema = CollectionSchema(
  name: r'BlockCollection',
  id: 5417308939645646360,
  properties: {
    r'blockStyle': PropertySchema(
      id: 0,
      name: r'blockStyle',
      type: IsarType.byte,
      enumMap: _BlockCollectionblockStyleEnumValueMap,
    ),
    r'childIds': PropertySchema(
      id: 1,
      name: r'childIds',
      type: IsarType.longList,
    ),
    r'hasThreadAsParent': PropertySchema(
      id: 2,
      name: r'hasThreadAsParent',
      type: IsarType.bool,
    ),
    r'inlineStyles': PropertySchema(
      id: 3,
      name: r'inlineStyles',
      type: IsarType.objectList,
      target: r'StyleNode',
    ),
    r'parent': PropertySchema(
      id: 4,
      name: r'parent',
      type: IsarType.long,
    ),
    r'text': PropertySchema(
      id: 5,
      name: r'text',
      type: IsarType.string,
    )
  },
  estimateSize: _blockCollectionEstimateSize,
  serialize: _blockCollectionSerialize,
  deserialize: _blockCollectionDeserialize,
  deserializeProp: _blockCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'StyleNode': StyleNodeSchema},
  getId: _blockCollectionGetId,
  getLinks: _blockCollectionGetLinks,
  attach: _blockCollectionAttach,
  version: '3.1.0+1',
);

int _blockCollectionEstimateSize(
  BlockCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.childIds.length * 8;
  bytesCount += 3 + object.inlineStyles.length * 3;
  {
    final offsets = allOffsets[StyleNode]!;
    for (var i = 0; i < object.inlineStyles.length; i++) {
      final value = object.inlineStyles[i];
      bytesCount += StyleNodeSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.text.length * 3;
  return bytesCount;
}

void _blockCollectionSerialize(
  BlockCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.blockStyle.index);
  writer.writeLongList(offsets[1], object.childIds);
  writer.writeBool(offsets[2], object.hasThreadAsParent);
  writer.writeObjectList<StyleNode>(
    offsets[3],
    allOffsets,
    StyleNodeSchema.serialize,
    object.inlineStyles,
  );
  writer.writeLong(offsets[4], object.parent);
  writer.writeString(offsets[5], object.text);
}

BlockCollection _blockCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BlockCollection(
    blockStyle: _BlockCollectionblockStyleValueEnumMap[
            reader.readByteOrNull(offsets[0])] ??
        BlockStyle.none,
    childIds: reader.readLongList(offsets[1]) ?? const [],
    hasThreadAsParent: reader.readBoolOrNull(offsets[2]) ?? true,
    id: id,
    inlineStyles: reader.readObjectList<StyleNode>(
          offsets[3],
          StyleNodeSchema.deserialize,
          allOffsets,
          StyleNode(),
        ) ??
        const [],
    parent: reader.readLong(offsets[4]),
    text: reader.readStringOrNull(offsets[5]) ?? 'Blank state text',
  );
  return object;
}

P _blockCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_BlockCollectionblockStyleValueEnumMap[
              reader.readByteOrNull(offset)] ??
          BlockStyle.none) as P;
    case 1:
      return (reader.readLongList(offset) ?? const []) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 3:
      return (reader.readObjectList<StyleNode>(
            offset,
            StyleNodeSchema.deserialize,
            allOffsets,
            StyleNode(),
          ) ??
          const []) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset) ?? 'Blank state text') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BlockCollectionblockStyleEnumValueMap = {
  'none': 0,
  'heading1': 1,
  'heading2': 2,
  'heading3': 3,
  'heading4': 4,
  'heading5': 5,
  'heading6': 6,
};
const _BlockCollectionblockStyleValueEnumMap = {
  0: BlockStyle.none,
  1: BlockStyle.heading1,
  2: BlockStyle.heading2,
  3: BlockStyle.heading3,
  4: BlockStyle.heading4,
  5: BlockStyle.heading5,
  6: BlockStyle.heading6,
};

Id _blockCollectionGetId(BlockCollection object) => object.id;

List<IsarLinkBase<dynamic>> _blockCollectionGetLinks(BlockCollection object) => [];

void _blockCollectionAttach(
    IsarCollection<dynamic> col, Id id, BlockCollection object) {}

extension BlockCollectionQueryWhereSort
    on QueryBuilder<BlockCollection, BlockCollection, QWhere> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterWhere> anyId() => QueryBuilder.apply(this, (query) => query.addWhereClause(const IdWhereClause.any()));
}

extension BlockCollectionQueryWhere
    on QueryBuilder<BlockCollection, BlockCollection, QWhereClause> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterWhereClause> idEqualTo(
      Id id) => QueryBuilder.apply(this, (query) => query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterWhereClause>
      idNotEqualTo(Id id) => QueryBuilder.apply(this, (query) {
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

  QueryBuilder<BlockCollection, BlockCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) => QueryBuilder.apply(this, (query) => query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) => QueryBuilder.apply(this, (query) => query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) => QueryBuilder.apply(this, (query) => query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      )));
}

extension BlockCollectionQueryFilter
    on QueryBuilder<BlockCollection, BlockCollection, QFilterCondition> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      blockStyleEqualTo(BlockStyle value) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockStyle',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      blockStyleGreaterThan(
    BlockStyle value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockStyle',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      blockStyleLessThan(
    BlockStyle value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockStyle',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      blockStyleBetween(
    BlockStyle lower,
    BlockStyle upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.between(
        property: r'blockStyle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childIdsElementEqualTo(int value) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.equalTo(
        property: r'childIds',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'childIds',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childIdsElementLessThan(
    int value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'childIds',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.between(
        property: r'childIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childIdsLengthEqualTo(int length) => QueryBuilder.apply(this, (query) => query.listLength(
        r'childIds',
        length,
        true,
        length,
        true,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childIdsIsEmpty() => QueryBuilder.apply(this, (query) => query.listLength(
        r'childIds',
        0,
        true,
        0,
        true,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childIdsIsNotEmpty() => QueryBuilder.apply(this, (query) => query.listLength(
        r'childIds',
        0,
        false,
        999999,
        true,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childIdsLengthLessThan(
    int length, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.listLength(
        r'childIds',
        0,
        true,
        length,
        include,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.listLength(
        r'childIds',
        length,
        include,
        999999,
        true,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) => QueryBuilder.apply(this, (query) => query.listLength(
        r'childIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      hasThreadAsParentEqualTo(bool value) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasThreadAsParent',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      idEqualTo(Id value) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      inlineStylesLengthEqualTo(int length) => QueryBuilder.apply(this, (query) => query.listLength(
        r'inlineStyles',
        length,
        true,
        length,
        true,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      inlineStylesIsEmpty() => QueryBuilder.apply(this, (query) => query.listLength(
        r'inlineStyles',
        0,
        true,
        0,
        true,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      inlineStylesIsNotEmpty() => QueryBuilder.apply(this, (query) => query.listLength(
        r'inlineStyles',
        0,
        false,
        999999,
        true,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      inlineStylesLengthLessThan(
    int length, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.listLength(
        r'inlineStyles',
        0,
        true,
        length,
        include,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      inlineStylesLengthGreaterThan(
    int length, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.listLength(
        r'inlineStyles',
        length,
        include,
        999999,
        true,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      inlineStylesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) => QueryBuilder.apply(this, (query) => query.listLength(
        r'inlineStyles',
        lower,
        includeLower,
        upper,
        includeUpper,
      ));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      parentEqualTo(int value) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.equalTo(
        property: r'parent',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      parentGreaterThan(
    int value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parent',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      parentLessThan(
    int value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parent',
        value: value,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      parentBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.between(
        property: r'parent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textEqualTo(
    String value, {
    bool caseSensitive = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textIsEmpty() => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      )));

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textIsNotEmpty() => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      )));
}

extension BlockCollectionQueryObject
    on QueryBuilder<BlockCollection, BlockCollection, QFilterCondition> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      inlineStylesElement(FilterQuery<StyleNode> q) => QueryBuilder.apply(this, (query) => query.object(q, r'inlineStyles'));
}

extension BlockCollectionQueryLinks
    on QueryBuilder<BlockCollection, BlockCollection, QFilterCondition> {}

extension BlockCollectionQuerySortBy
    on QueryBuilder<BlockCollection, BlockCollection, QSortBy> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      sortByBlockStyle() => QueryBuilder.apply(this, (query) => query.addSortBy(r'blockStyle', Sort.asc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      sortByBlockStyleDesc() => QueryBuilder.apply(this, (query) => query.addSortBy(r'blockStyle', Sort.desc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      sortByHasThreadAsParent() => QueryBuilder.apply(this, (query) => query.addSortBy(r'hasThreadAsParent', Sort.asc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      sortByHasThreadAsParentDesc() => QueryBuilder.apply(this, (query) => query.addSortBy(r'hasThreadAsParent', Sort.desc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy> sortByParent() => QueryBuilder.apply(this, (query) => query.addSortBy(r'parent', Sort.asc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      sortByParentDesc() => QueryBuilder.apply(this, (query) => query.addSortBy(r'parent', Sort.desc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy> sortByText() => QueryBuilder.apply(this, (query) => query.addSortBy(r'text', Sort.asc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      sortByTextDesc() => QueryBuilder.apply(this, (query) => query.addSortBy(r'text', Sort.desc));
}

extension BlockCollectionQuerySortThenBy
    on QueryBuilder<BlockCollection, BlockCollection, QSortThenBy> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      thenByBlockStyle() => QueryBuilder.apply(this, (query) => query.addSortBy(r'blockStyle', Sort.asc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      thenByBlockStyleDesc() => QueryBuilder.apply(this, (query) => query.addSortBy(r'blockStyle', Sort.desc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      thenByHasThreadAsParent() => QueryBuilder.apply(this, (query) => query.addSortBy(r'hasThreadAsParent', Sort.asc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      thenByHasThreadAsParentDesc() => QueryBuilder.apply(this, (query) => query.addSortBy(r'hasThreadAsParent', Sort.desc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy> thenById() => QueryBuilder.apply(this, (query) => query.addSortBy(r'id', Sort.asc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy> thenByIdDesc() => QueryBuilder.apply(this, (query) => query.addSortBy(r'id', Sort.desc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy> thenByParent() => QueryBuilder.apply(this, (query) => query.addSortBy(r'parent', Sort.asc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      thenByParentDesc() => QueryBuilder.apply(this, (query) => query.addSortBy(r'parent', Sort.desc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy> thenByText() => QueryBuilder.apply(this, (query) => query.addSortBy(r'text', Sort.asc));

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy>
      thenByTextDesc() => QueryBuilder.apply(this, (query) => query.addSortBy(r'text', Sort.desc));
}

extension BlockCollectionQueryWhereDistinct
    on QueryBuilder<BlockCollection, BlockCollection, QDistinct> {
  QueryBuilder<BlockCollection, BlockCollection, QDistinct>
      distinctByBlockStyle() => QueryBuilder.apply(this, (query) => query.addDistinctBy(r'blockStyle'));

  QueryBuilder<BlockCollection, BlockCollection, QDistinct>
      distinctByChildIds() => QueryBuilder.apply(this, (query) => query.addDistinctBy(r'childIds'));

  QueryBuilder<BlockCollection, BlockCollection, QDistinct>
      distinctByHasThreadAsParent() => QueryBuilder.apply(this, (query) => query.addDistinctBy(r'hasThreadAsParent'));

  QueryBuilder<BlockCollection, BlockCollection, QDistinct> distinctByParent() => QueryBuilder.apply(this, (query) => query.addDistinctBy(r'parent'));

  QueryBuilder<BlockCollection, BlockCollection, QDistinct> distinctByText(
      {bool caseSensitive = true}) => QueryBuilder.apply(this, (query) => query.addDistinctBy(r'text', caseSensitive: caseSensitive));
}

extension BlockCollectionQueryProperty
    on QueryBuilder<BlockCollection, BlockCollection, QQueryProperty> {
  QueryBuilder<BlockCollection, int, QQueryOperations> idProperty() => QueryBuilder.apply(this, (query) => query.addPropertyName(r'id'));

  QueryBuilder<BlockCollection, BlockStyle, QQueryOperations>
      blockStyleProperty() => QueryBuilder.apply(this, (query) => query.addPropertyName(r'blockStyle'));

  QueryBuilder<BlockCollection, List<int>, QQueryOperations>
      childIdsProperty() => QueryBuilder.apply(this, (query) => query.addPropertyName(r'childIds'));

  QueryBuilder<BlockCollection, bool, QQueryOperations>
      hasThreadAsParentProperty() => QueryBuilder.apply(this, (query) => query.addPropertyName(r'hasThreadAsParent'));

  QueryBuilder<BlockCollection, List<StyleNode>, QQueryOperations>
      inlineStylesProperty() => QueryBuilder.apply(this, (query) => query.addPropertyName(r'inlineStyles'));

  QueryBuilder<BlockCollection, int, QQueryOperations> parentProperty() => QueryBuilder.apply(this, (query) => query.addPropertyName(r'parent'));

  QueryBuilder<BlockCollection, String, QQueryOperations> textProperty() => QueryBuilder.apply(this, (query) => query.addPropertyName(r'text'));
}
