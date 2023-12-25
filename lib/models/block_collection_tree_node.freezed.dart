// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_collection_tree_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlockCollectionTreeNode {
  BlockCollection get blockCollection => throw _privateConstructorUsedError;
  List<BlockCollectionTreeNode> get childBlocks =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockCollectionTreeNodeCopyWith<BlockCollectionTreeNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockCollectionTreeNodeCopyWith<$Res> {
  factory $BlockCollectionTreeNodeCopyWith(BlockCollectionTreeNode value,
          $Res Function(BlockCollectionTreeNode) then) =
      _$BlockCollectionTreeNodeCopyWithImpl<$Res, BlockCollectionTreeNode>;
  @useResult
  $Res call(
      {BlockCollection blockCollection,
      List<BlockCollectionTreeNode> childBlocks});
}

/// @nodoc
class _$BlockCollectionTreeNodeCopyWithImpl<$Res,
        $Val extends BlockCollectionTreeNode>
    implements $BlockCollectionTreeNodeCopyWith<$Res> {
  _$BlockCollectionTreeNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockCollection = null,
    Object? childBlocks = null,
  }) {
    return _then(_value.copyWith(
      blockCollection: null == blockCollection
          ? _value.blockCollection
          : blockCollection // ignore: cast_nullable_to_non_nullable
              as BlockCollection,
      childBlocks: null == childBlocks
          ? _value.childBlocks
          : childBlocks // ignore: cast_nullable_to_non_nullable
              as List<BlockCollectionTreeNode>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockCollectionTreeNodeImplCopyWith<$Res>
    implements $BlockCollectionTreeNodeCopyWith<$Res> {
  factory _$$BlockCollectionTreeNodeImplCopyWith(
          _$BlockCollectionTreeNodeImpl value,
          $Res Function(_$BlockCollectionTreeNodeImpl) then) =
      __$$BlockCollectionTreeNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlockCollection blockCollection,
      List<BlockCollectionTreeNode> childBlocks});
}

/// @nodoc
class __$$BlockCollectionTreeNodeImplCopyWithImpl<$Res>
    extends _$BlockCollectionTreeNodeCopyWithImpl<$Res,
        _$BlockCollectionTreeNodeImpl>
    implements _$$BlockCollectionTreeNodeImplCopyWith<$Res> {
  __$$BlockCollectionTreeNodeImplCopyWithImpl(
      _$BlockCollectionTreeNodeImpl _value,
      $Res Function(_$BlockCollectionTreeNodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockCollection = null,
    Object? childBlocks = null,
  }) {
    return _then(_$BlockCollectionTreeNodeImpl(
      blockCollection: null == blockCollection
          ? _value.blockCollection
          : blockCollection // ignore: cast_nullable_to_non_nullable
              as BlockCollection,
      childBlocks: null == childBlocks
          ? _value._childBlocks
          : childBlocks // ignore: cast_nullable_to_non_nullable
              as List<BlockCollectionTreeNode>,
    ));
  }
}

/// @nodoc

class _$BlockCollectionTreeNodeImpl implements _BlockCollectionTreeNode {
  const _$BlockCollectionTreeNodeImpl(
      {required this.blockCollection,
      required final List<BlockCollectionTreeNode> childBlocks})
      : _childBlocks = childBlocks;

  @override
  final BlockCollection blockCollection;
  final List<BlockCollectionTreeNode> _childBlocks;
  @override
  List<BlockCollectionTreeNode> get childBlocks {
    if (_childBlocks is EqualUnmodifiableListView) return _childBlocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_childBlocks);
  }

  @override
  String toString() {
    return 'BlockCollectionTreeNode(blockCollection: $blockCollection, childBlocks: $childBlocks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockCollectionTreeNodeImpl &&
            (identical(other.blockCollection, blockCollection) ||
                other.blockCollection == blockCollection) &&
            const DeepCollectionEquality()
                .equals(other._childBlocks, _childBlocks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blockCollection,
      const DeepCollectionEquality().hash(_childBlocks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockCollectionTreeNodeImplCopyWith<_$BlockCollectionTreeNodeImpl>
      get copyWith => __$$BlockCollectionTreeNodeImplCopyWithImpl<
          _$BlockCollectionTreeNodeImpl>(this, _$identity);
}

abstract class _BlockCollectionTreeNode implements BlockCollectionTreeNode {
  const factory _BlockCollectionTreeNode(
          {required final BlockCollection blockCollection,
          required final List<BlockCollectionTreeNode> childBlocks}) =
      _$BlockCollectionTreeNodeImpl;

  @override
  BlockCollection get blockCollection;
  @override
  List<BlockCollectionTreeNode> get childBlocks;
  @override
  @JsonKey(ignore: true)
  _$$BlockCollectionTreeNodeImplCopyWith<_$BlockCollectionTreeNodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
