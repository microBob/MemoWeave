// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'style_node.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const StyleNodeSchema = Schema(
  name: r'StyleNode',
  id: 1342748013343944162,
  properties: {
    r'endIndex': PropertySchema(
      id: 0,
      name: r'endIndex',
      type: IsarType.long,
    ),
    r'startIndex': PropertySchema(
      id: 1,
      name: r'startIndex',
      type: IsarType.long,
    ),
    r'styles': PropertySchema(
      id: 2,
      name: r'styles',
      type: IsarType.byteList,
      enumMap: _StyleNodestylesEnumValueMap,
    )
  },
  estimateSize: _styleNodeEstimateSize,
  serialize: _styleNodeSerialize,
  deserialize: _styleNodeDeserialize,
  deserializeProp: _styleNodeDeserializeProp,
);

int _styleNodeEstimateSize(
  StyleNode object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.styles.length;
  return bytesCount;
}

void _styleNodeSerialize(
  StyleNode object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.endIndex);
  writer.writeLong(offsets[1], object.startIndex);
  writer.writeByteList(offsets[2], object.styles.map((e) => e.index).toList());
}

StyleNode _styleNodeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StyleNode(
    endIndex: reader.readLongOrNull(offsets[0]) ?? 0,
    startIndex: reader.readLongOrNull(offsets[1]) ?? 0,
    styles: reader
            .readByteList(offsets[2])
            ?.map((e) => _StyleNodestylesValueEnumMap[e] ?? InlineStyle.bold)
            .toList() ??
        const [],
  );
  return object;
}

P _styleNodeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader
              .readByteList(offset)
              ?.map((e) => _StyleNodestylesValueEnumMap[e] ?? InlineStyle.bold)
              .toList() ??
          const []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _StyleNodestylesEnumValueMap = {
  'bold': 0,
  'italic': 1,
};
const _StyleNodestylesValueEnumMap = {
  0: InlineStyle.bold,
  1: InlineStyle.italic,
};

extension StyleNodeQueryFilter
    on QueryBuilder<StyleNode, StyleNode, QFilterCondition> {
  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition> endIndexEqualTo(
      int value) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.equalTo(
        property: r'endIndex',
        value: value,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition> endIndexGreaterThan(
    int value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endIndex',
        value: value,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition> endIndexLessThan(
    int value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endIndex',
        value: value,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition> endIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.between(
        property: r'endIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition> startIndexEqualTo(
      int value) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.equalTo(
        property: r'startIndex',
        value: value,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition>
      startIndexGreaterThan(
    int value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startIndex',
        value: value,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition> startIndexLessThan(
    int value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startIndex',
        value: value,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition> startIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.between(
        property: r'startIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition>
      stylesElementEqualTo(InlineStyle value) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.equalTo(
        property: r'styles',
        value: value,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition>
      stylesElementGreaterThan(
    InlineStyle value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'styles',
        value: value,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition>
      stylesElementLessThan(
    InlineStyle value, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'styles',
        value: value,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition>
      stylesElementBetween(
    InlineStyle lower,
    InlineStyle upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) => QueryBuilder.apply(this, (query) => query.addFilterCondition(FilterCondition.between(
        property: r'styles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      )));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition> stylesLengthEqualTo(
      int length) => QueryBuilder.apply(this, (query) => query.listLength(
        r'styles',
        length,
        true,
        length,
        true,
      ));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition> stylesIsEmpty() => QueryBuilder.apply(this, (query) => query.listLength(
        r'styles',
        0,
        true,
        0,
        true,
      ));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition> stylesIsNotEmpty() => QueryBuilder.apply(this, (query) => query.listLength(
        r'styles',
        0,
        false,
        999999,
        true,
      ));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition>
      stylesLengthLessThan(
    int length, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.listLength(
        r'styles',
        0,
        true,
        length,
        include,
      ));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition>
      stylesLengthGreaterThan(
    int length, {
    bool include = false,
  }) => QueryBuilder.apply(this, (query) => query.listLength(
        r'styles',
        length,
        include,
        999999,
        true,
      ));

  QueryBuilder<StyleNode, StyleNode, QAfterFilterCondition> stylesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) => QueryBuilder.apply(this, (query) => query.listLength(
        r'styles',
        lower,
        includeLower,
        upper,
        includeUpper,
      ));
}

extension StyleNodeQueryObject
    on QueryBuilder<StyleNode, StyleNode, QFilterCondition> {}
