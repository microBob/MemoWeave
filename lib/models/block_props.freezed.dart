// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_props.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlockProps {
  BlockCollectionTreeNode get blockCollectionTreeNode =>
      throw _privateConstructorUsedError;
  int get idOfBlockInFocus => throw _privateConstructorUsedError;
  KeyEventResult Function(FocusNode, KeyEvent) get onEditorTraversalCallback =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockPropsCopyWith<BlockProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockPropsCopyWith<$Res> {
  factory $BlockPropsCopyWith(
          BlockProps value, $Res Function(BlockProps) then) =
      _$BlockPropsCopyWithImpl<$Res, BlockProps>;
  @useResult
  $Res call(
      {BlockCollectionTreeNode blockCollectionTreeNode,
      int idOfBlockInFocus,
      KeyEventResult Function(FocusNode, KeyEvent) onEditorTraversalCallback});

  $BlockCollectionTreeNodeCopyWith<$Res> get blockCollectionTreeNode;
}

/// @nodoc
class _$BlockPropsCopyWithImpl<$Res, $Val extends BlockProps>
    implements $BlockPropsCopyWith<$Res> {
  _$BlockPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockCollectionTreeNode = null,
    Object? idOfBlockInFocus = null,
    Object? onEditorTraversalCallback = null,
  }) {
    return _then(_value.copyWith(
      blockCollectionTreeNode: null == blockCollectionTreeNode
          ? _value.blockCollectionTreeNode
          : blockCollectionTreeNode // ignore: cast_nullable_to_non_nullable
              as BlockCollectionTreeNode,
      idOfBlockInFocus: null == idOfBlockInFocus
          ? _value.idOfBlockInFocus
          : idOfBlockInFocus // ignore: cast_nullable_to_non_nullable
              as int,
      onEditorTraversalCallback: null == onEditorTraversalCallback
          ? _value.onEditorTraversalCallback
          : onEditorTraversalCallback // ignore: cast_nullable_to_non_nullable
              as KeyEventResult Function(FocusNode, KeyEvent),
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BlockCollectionTreeNodeCopyWith<$Res> get blockCollectionTreeNode {
    return $BlockCollectionTreeNodeCopyWith<$Res>(
        _value.blockCollectionTreeNode, (value) {
      return _then(_value.copyWith(blockCollectionTreeNode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BlockPropsImplCopyWith<$Res>
    implements $BlockPropsCopyWith<$Res> {
  factory _$$BlockPropsImplCopyWith(
          _$BlockPropsImpl value, $Res Function(_$BlockPropsImpl) then) =
      __$$BlockPropsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlockCollectionTreeNode blockCollectionTreeNode,
      int idOfBlockInFocus,
      KeyEventResult Function(FocusNode, KeyEvent) onEditorTraversalCallback});

  @override
  $BlockCollectionTreeNodeCopyWith<$Res> get blockCollectionTreeNode;
}

/// @nodoc
class __$$BlockPropsImplCopyWithImpl<$Res>
    extends _$BlockPropsCopyWithImpl<$Res, _$BlockPropsImpl>
    implements _$$BlockPropsImplCopyWith<$Res> {
  __$$BlockPropsImplCopyWithImpl(
      _$BlockPropsImpl _value, $Res Function(_$BlockPropsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockCollectionTreeNode = null,
    Object? idOfBlockInFocus = null,
    Object? onEditorTraversalCallback = null,
  }) {
    return _then(_$BlockPropsImpl(
      blockCollectionTreeNode: null == blockCollectionTreeNode
          ? _value.blockCollectionTreeNode
          : blockCollectionTreeNode // ignore: cast_nullable_to_non_nullable
              as BlockCollectionTreeNode,
      idOfBlockInFocus: null == idOfBlockInFocus
          ? _value.idOfBlockInFocus
          : idOfBlockInFocus // ignore: cast_nullable_to_non_nullable
              as int,
      onEditorTraversalCallback: null == onEditorTraversalCallback
          ? _value.onEditorTraversalCallback
          : onEditorTraversalCallback // ignore: cast_nullable_to_non_nullable
              as KeyEventResult Function(FocusNode, KeyEvent),
    ));
  }
}

/// @nodoc

class _$BlockPropsImpl implements _BlockProps {
  const _$BlockPropsImpl(
      {required this.blockCollectionTreeNode,
      required this.idOfBlockInFocus,
      required this.onEditorTraversalCallback});

  @override
  final BlockCollectionTreeNode blockCollectionTreeNode;
  @override
  final int idOfBlockInFocus;
  @override
  final KeyEventResult Function(FocusNode, KeyEvent) onEditorTraversalCallback;

  @override
  String toString() {
    return 'BlockProps(blockCollectionTreeNode: $blockCollectionTreeNode, idOfBlockInFocus: $idOfBlockInFocus, onEditorTraversalCallback: $onEditorTraversalCallback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockPropsImpl &&
            (identical(
                    other.blockCollectionTreeNode, blockCollectionTreeNode) ||
                other.blockCollectionTreeNode == blockCollectionTreeNode) &&
            (identical(other.idOfBlockInFocus, idOfBlockInFocus) ||
                other.idOfBlockInFocus == idOfBlockInFocus) &&
            (identical(other.onEditorTraversalCallback,
                    onEditorTraversalCallback) ||
                other.onEditorTraversalCallback == onEditorTraversalCallback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blockCollectionTreeNode,
      idOfBlockInFocus, onEditorTraversalCallback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockPropsImplCopyWith<_$BlockPropsImpl> get copyWith =>
      __$$BlockPropsImplCopyWithImpl<_$BlockPropsImpl>(this, _$identity);
}

abstract class _BlockProps implements BlockProps {
  const factory _BlockProps(
      {required final BlockCollectionTreeNode blockCollectionTreeNode,
      required final int idOfBlockInFocus,
      required final KeyEventResult Function(FocusNode, KeyEvent)
          onEditorTraversalCallback}) = _$BlockPropsImpl;

  @override
  BlockCollectionTreeNode get blockCollectionTreeNode;
  @override
  int get idOfBlockInFocus;
  @override
  KeyEventResult Function(FocusNode, KeyEvent) get onEditorTraversalCallback;
  @override
  @JsonKey(ignore: true)
  _$$BlockPropsImplCopyWith<_$BlockPropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
