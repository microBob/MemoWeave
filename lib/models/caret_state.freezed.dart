// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'caret_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CaretState {
  int get caretTextOffset => throw _privateConstructorUsedError;

  Rect get caretLocalRect => throw _privateConstructorUsedError;

  Offset get caretGlobalPosition => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CaretStateCopyWith<CaretState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaretStateCopyWith<$Res> {
  factory $CaretStateCopyWith(
          CaretState value, $Res Function(CaretState) then) =
      _$CaretStateCopyWithImpl<$Res, CaretState>;

  @useResult
  $Res call(
      {int caretTextOffset, Rect caretLocalRect, Offset caretGlobalPosition});
}

/// @nodoc
class _$CaretStateCopyWithImpl<$Res, $Val extends CaretState>
    implements $CaretStateCopyWith<$Res> {
  _$CaretStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caretTextOffset = null,
    Object? caretLocalRect = null,
    Object? caretGlobalPosition = null,
  }) {
    return _then(_value.copyWith(
      caretTextOffset: null == caretTextOffset
          ? _value.caretTextOffset
          : caretTextOffset // ignore: cast_nullable_to_non_nullable
              as int,
      caretLocalRect: null == caretLocalRect
          ? _value.caretLocalRect
          : caretLocalRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      caretGlobalPosition: null == caretGlobalPosition
          ? _value.caretGlobalPosition
          : caretGlobalPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaretStateImplCopyWith<$Res>
    implements $CaretStateCopyWith<$Res> {
  factory _$$CaretStateImplCopyWith(
          _$CaretStateImpl value, $Res Function(_$CaretStateImpl) then) =
      __$$CaretStateImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {int caretTextOffset, Rect caretLocalRect, Offset caretGlobalPosition});
}

/// @nodoc
class __$$CaretStateImplCopyWithImpl<$Res>
    extends _$CaretStateCopyWithImpl<$Res, _$CaretStateImpl>
    implements _$$CaretStateImplCopyWith<$Res> {
  __$$CaretStateImplCopyWithImpl(
      _$CaretStateImpl _value, $Res Function(_$CaretStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caretTextOffset = null,
    Object? caretLocalRect = null,
    Object? caretGlobalPosition = null,
  }) {
    return _then(_$CaretStateImpl(
      caretTextOffset: null == caretTextOffset
          ? _value.caretTextOffset
          : caretTextOffset // ignore: cast_nullable_to_non_nullable
              as int,
      caretLocalRect: null == caretLocalRect
          ? _value.caretLocalRect
          : caretLocalRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      caretGlobalPosition: null == caretGlobalPosition
          ? _value.caretGlobalPosition
          : caretGlobalPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$CaretStateImpl implements _CaretState {
  const _$CaretStateImpl(
      {required this.caretTextOffset,
      required this.caretLocalRect,
      required this.caretGlobalPosition});

  @override
  final int caretTextOffset;
  @override
  final Rect caretLocalRect;
  @override
  final Offset caretGlobalPosition;

  @override
  String toString() {
    return 'CaretState(caretTextOffset: $caretTextOffset, caretLocalRect: $caretLocalRect, caretGlobalPosition: $caretGlobalPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaretStateImpl &&
            (identical(other.caretTextOffset, caretTextOffset) ||
                other.caretTextOffset == caretTextOffset) &&
            (identical(other.caretLocalRect, caretLocalRect) ||
                other.caretLocalRect == caretLocalRect) &&
            (identical(other.caretGlobalPosition, caretGlobalPosition) ||
                other.caretGlobalPosition == caretGlobalPosition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, caretTextOffset, caretLocalRect, caretGlobalPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CaretStateImplCopyWith<_$CaretStateImpl> get copyWith =>
      __$$CaretStateImplCopyWithImpl<_$CaretStateImpl>(this, _$identity);
}

abstract class _CaretState implements CaretState {
  const factory _CaretState(
      {required final int caretTextOffset,
      required final Rect caretLocalRect,
      required final Offset caretGlobalPosition}) = _$CaretStateImpl;

  @override
  int get caretTextOffset;

  @override
  Rect get caretLocalRect;

  @override
  Offset get caretGlobalPosition;

  @override
  @JsonKey(ignore: true)
  _$$CaretStateImplCopyWith<_$CaretStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
