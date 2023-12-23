// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThreadState {
// Block focus.
  int get idOfBlockInFocus => throw _privateConstructorUsedError;

  bool get traversingBlocks =>
      throw _privateConstructorUsedError; // Caret state.
  int get caretTextOffset => throw _privateConstructorUsedError;

  Offset get caretGlobalPosition =>
      throw _privateConstructorUsedError; // Thread and its Blocks.
  ThreadCollection get threadCollection => throw _privateConstructorUsedError;

  List<BlockCollectionTreeNode> get blockCollectionTreeNodes =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThreadStateCopyWith<ThreadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadStateCopyWith<$Res> {
  factory $ThreadStateCopyWith(
          ThreadState value, $Res Function(ThreadState) then) =
      _$ThreadStateCopyWithImpl<$Res, ThreadState>;
  @useResult
  $Res call(
      {int idOfBlockInFocus,
      bool traversingBlocks,
      int caretTextOffset,
      Offset caretGlobalPosition,
      ThreadCollection threadCollection,
      List<BlockCollectionTreeNode> blockCollectionTreeNodes});
}

/// @nodoc
class _$ThreadStateCopyWithImpl<$Res, $Val extends ThreadState>
    implements $ThreadStateCopyWith<$Res> {
  _$ThreadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOfBlockInFocus = null,
    Object? traversingBlocks = null,
    Object? caretTextOffset = null,
    Object? caretGlobalPosition = null,
    Object? threadCollection = null,
    Object? blockCollectionTreeNodes = null,
  }) {
    return _then(_value.copyWith(
      idOfBlockInFocus: null == idOfBlockInFocus
          ? _value.idOfBlockInFocus
          : idOfBlockInFocus // ignore: cast_nullable_to_non_nullable
              as int,
      traversingBlocks: null == traversingBlocks
          ? _value.traversingBlocks
          : traversingBlocks // ignore: cast_nullable_to_non_nullable
              as bool,
      caretTextOffset: null == caretTextOffset
          ? _value.caretTextOffset
          : caretTextOffset // ignore: cast_nullable_to_non_nullable
              as int,
      caretGlobalPosition: null == caretGlobalPosition
          ? _value.caretGlobalPosition
          : caretGlobalPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      threadCollection: null == threadCollection
          ? _value.threadCollection
          : threadCollection // ignore: cast_nullable_to_non_nullable
              as ThreadCollection,
      blockCollectionTreeNodes: null == blockCollectionTreeNodes
          ? _value.blockCollectionTreeNodes
          : blockCollectionTreeNodes // ignore: cast_nullable_to_non_nullable
              as List<BlockCollectionTreeNode>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreadStateImplCopyWith<$Res>
    implements $ThreadStateCopyWith<$Res> {
  factory _$$ThreadStateImplCopyWith(
          _$ThreadStateImpl value, $Res Function(_$ThreadStateImpl) then) =
      __$$ThreadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int idOfBlockInFocus,
      bool traversingBlocks,
      int caretTextOffset,
      Offset caretGlobalPosition,
      ThreadCollection threadCollection,
      List<BlockCollectionTreeNode> blockCollectionTreeNodes});
}

/// @nodoc
class __$$ThreadStateImplCopyWithImpl<$Res>
    extends _$ThreadStateCopyWithImpl<$Res, _$ThreadStateImpl>
    implements _$$ThreadStateImplCopyWith<$Res> {
  __$$ThreadStateImplCopyWithImpl(
      _$ThreadStateImpl _value, $Res Function(_$ThreadStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOfBlockInFocus = null,
    Object? traversingBlocks = null,
    Object? caretTextOffset = null,
    Object? caretGlobalPosition = null,
    Object? threadCollection = null,
    Object? blockCollectionTreeNodes = null,
  }) {
    return _then(_$ThreadStateImpl(
      idOfBlockInFocus: null == idOfBlockInFocus
          ? _value.idOfBlockInFocus
          : idOfBlockInFocus // ignore: cast_nullable_to_non_nullable
              as int,
      traversingBlocks: null == traversingBlocks
          ? _value.traversingBlocks
          : traversingBlocks // ignore: cast_nullable_to_non_nullable
              as bool,
      caretTextOffset: null == caretTextOffset
          ? _value.caretTextOffset
          : caretTextOffset // ignore: cast_nullable_to_non_nullable
              as int,
      caretGlobalPosition: null == caretGlobalPosition
          ? _value.caretGlobalPosition
          : caretGlobalPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      threadCollection: null == threadCollection
          ? _value.threadCollection
          : threadCollection // ignore: cast_nullable_to_non_nullable
              as ThreadCollection,
      blockCollectionTreeNodes: null == blockCollectionTreeNodes
          ? _value._blockCollectionTreeNodes
          : blockCollectionTreeNodes // ignore: cast_nullable_to_non_nullable
              as List<BlockCollectionTreeNode>,
    ));
  }
}

/// @nodoc

class _$ThreadStateImpl implements _ThreadState {
  const _$ThreadStateImpl(
      {required this.idOfBlockInFocus,
      required this.traversingBlocks,
      required this.caretTextOffset,
      required this.caretGlobalPosition,
      required this.threadCollection,
      required final List<BlockCollectionTreeNode> blockCollectionTreeNodes})
      : _blockCollectionTreeNodes = blockCollectionTreeNodes;

// Block focus.
  @override
  final int idOfBlockInFocus;
  @override
  final bool traversingBlocks;

// Caret state.
  @override
  final int caretTextOffset;
  @override
  final Offset caretGlobalPosition;

// Thread and its Blocks.
  @override
  final ThreadCollection threadCollection;
  final List<BlockCollectionTreeNode> _blockCollectionTreeNodes;

  @override
  List<BlockCollectionTreeNode> get blockCollectionTreeNodes {
    if (_blockCollectionTreeNodes is EqualUnmodifiableListView)
      return _blockCollectionTreeNodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockCollectionTreeNodes);
  }

  @override
  String toString() {
    return 'ThreadState(idOfBlockInFocus: $idOfBlockInFocus, traversingBlocks: $traversingBlocks, caretTextOffset: $caretTextOffset, caretGlobalPosition: $caretGlobalPosition, threadCollection: $threadCollection, blockCollectionTreeNodes: $blockCollectionTreeNodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadStateImpl &&
            (identical(other.idOfBlockInFocus, idOfBlockInFocus) ||
                other.idOfBlockInFocus == idOfBlockInFocus) &&
            (identical(other.traversingBlocks, traversingBlocks) ||
                other.traversingBlocks == traversingBlocks) &&
            (identical(other.caretTextOffset, caretTextOffset) ||
                other.caretTextOffset == caretTextOffset) &&
            (identical(other.caretGlobalPosition, caretGlobalPosition) ||
                other.caretGlobalPosition == caretGlobalPosition) &&
            (identical(other.threadCollection, threadCollection) ||
                other.threadCollection == threadCollection) &&
            const DeepCollectionEquality().equals(
                other._blockCollectionTreeNodes, _blockCollectionTreeNodes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      idOfBlockInFocus,
      traversingBlocks,
      caretTextOffset,
      caretGlobalPosition,
      threadCollection,
      const DeepCollectionEquality().hash(_blockCollectionTreeNodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadStateImplCopyWith<_$ThreadStateImpl> get copyWith =>
      __$$ThreadStateImplCopyWithImpl<_$ThreadStateImpl>(this, _$identity);
}

abstract class _ThreadState implements ThreadState {
  const factory _ThreadState(
      {required final int idOfBlockInFocus,
      required final bool traversingBlocks,
      required final int caretTextOffset,
      required final Offset caretGlobalPosition,
      required final ThreadCollection threadCollection,
      required final List<BlockCollectionTreeNode>
          blockCollectionTreeNodes}) = _$ThreadStateImpl;

  @override // Block focus.
  int get idOfBlockInFocus;

  @override
  bool get traversingBlocks;

  @override // Caret state.
  int get caretTextOffset;

  @override
  Offset get caretGlobalPosition;

  @override // Thread and its Blocks.
  ThreadCollection get threadCollection;

  @override
  List<BlockCollectionTreeNode> get blockCollectionTreeNodes;

  @override
  @JsonKey(ignore: true)
  _$$ThreadStateImplCopyWith<_$ThreadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
