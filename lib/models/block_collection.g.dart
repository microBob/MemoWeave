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
    r'text': PropertySchema(
      id: 0,
      name: r'text',
      type: IsarType.objectList,
      target: r'TextNode',
    )
  },
  estimateSize: _blockCollectionEstimateSize,
  serialize: _blockCollectionSerialize,
  deserialize: _blockCollectionDeserialize,
  deserializeProp: _blockCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'children': LinkSchema(
      id: 2596747912997977508,
      name: r'children',
      target: r'BlockCollection',
      single: false,
    )
  },
  embeddedSchemas: {r'TextNode': TextNodeSchema},
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
  bytesCount += 3 + object.text.length * 3;
  {
    final offsets = allOffsets[TextNode]!;
    for (var i = 0; i < object.text.length; i++) {
      final value = object.text[i];
      bytesCount += TextNodeSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _blockCollectionSerialize(
  BlockCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<TextNode>(
    offsets[0],
    allOffsets,
    TextNodeSchema.serialize,
    object.text,
  );
}

BlockCollection _blockCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BlockCollection();
  object.text = reader.readObjectList<TextNode>(
        offsets[0],
        TextNodeSchema.deserialize,
        allOffsets,
        TextNode(),
      ) ??
      [];
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
      return (reader.readObjectList<TextNode>(
            offset,
            TextNodeSchema.deserialize,
            allOffsets,
            TextNode(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _blockCollectionGetId(BlockCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _blockCollectionGetLinks(BlockCollection object) {
  return [object.children];
}

void _blockCollectionAttach(
    IsarCollection<dynamic> col, Id id, BlockCollection object) {
  object.children
      .attach(col, col.isar.collection<BlockCollection>(), r'children', id);
}

extension BlockCollectionQueryWhereSort
    on QueryBuilder<BlockCollection, BlockCollection, QWhere> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BlockCollectionQueryWhere
    on QueryBuilder<BlockCollection, BlockCollection, QWhereClause> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterWhereClause>
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

  QueryBuilder<BlockCollection, BlockCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterWhereClause> idBetween(
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

extension BlockCollectionQueryFilter
    on QueryBuilder<BlockCollection, BlockCollection, QFilterCondition> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
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

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
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

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
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

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'text',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'text',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'text',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'text',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'text',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'text',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension BlockCollectionQueryObject
    on QueryBuilder<BlockCollection, BlockCollection, QFilterCondition> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      textElement(FilterQuery<TextNode> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'text');
    });
  }
}

extension BlockCollectionQueryLinks
    on QueryBuilder<BlockCollection, BlockCollection, QFilterCondition> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      children(FilterQuery<BlockCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'children');
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childrenLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'children', length, true, length, true);
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childrenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'children', 0, true, 0, true);
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childrenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'children', 0, false, 999999, true);
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childrenLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'children', 0, true, length, include);
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childrenLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'children', length, include, 999999, true);
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterFilterCondition>
      childrenLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'children', lower, includeLower, upper, includeUpper);
    });
  }
}

extension BlockCollectionQuerySortBy
    on QueryBuilder<BlockCollection, BlockCollection, QSortBy> {}

extension BlockCollectionQuerySortThenBy
    on QueryBuilder<BlockCollection, BlockCollection, QSortThenBy> {
  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BlockCollection, BlockCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension BlockCollectionQueryWhereDistinct
    on QueryBuilder<BlockCollection, BlockCollection, QDistinct> {}

extension BlockCollectionQueryProperty
    on QueryBuilder<BlockCollection, BlockCollection, QQueryProperty> {
  QueryBuilder<BlockCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BlockCollection, List<TextNode>, QQueryOperations>
      textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }
}
