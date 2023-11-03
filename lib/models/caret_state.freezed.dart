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
  int get caretPosition => throw _privateConstructorUsedError;
  Rect get caretRect => throw _privateConstructorUsedError;

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
  $Res call({int caretPosition, Rect caretRect});
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
    Object? caretPosition = null,
    Object? caretRect = null,
  }) {
    return _then(_value.copyWith(
      caretPosition: null == caretPosition
          ? _value.caretPosition
          : caretPosition // ignore: cast_nullable_to_non_nullable
              as int,
      caretRect: null == caretRect
          ? _value.caretRect
          : caretRect // ignore: cast_nullable_to_non_nullable
              as Rect,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CaretStateCopyWith<$Res>
    implements $CaretStateCopyWith<$Res> {
  factory _$$_CaretStateCopyWith(
          _$_CaretState value, $Res Function(_$_CaretState) then) =
      __$$_CaretStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int caretPosition, Rect caretRect});
}

/// @nodoc
class __$$_CaretStateCopyWithImpl<$Res>
    extends _$CaretStateCopyWithImpl<$Res, _$_CaretState>
    implements _$$_CaretStateCopyWith<$Res> {
  __$$_CaretStateCopyWithImpl(
      _$_CaretState _value, $Res Function(_$_CaretState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caretPosition = null,
    Object? caretRect = null,
  }) {
    return _then(_$_CaretState(
      caretPosition: null == caretPosition
          ? _value.caretPosition
          : caretPosition // ignore: cast_nullable_to_non_nullable
              as int,
      caretRect: null == caretRect
          ? _value.caretRect
          : caretRect // ignore: cast_nullable_to_non_nullable
              as Rect,
    ));
  }
}

/// @nodoc

class _$_CaretState implements _CaretState {
  const _$_CaretState({required this.caretPosition, required this.caretRect});

  @override
  final int caretPosition;
  @override
  final Rect caretRect;

  @override
  String toString() {
    return 'CaretState(caretPosition: $caretPosition, caretRect: $caretRect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CaretState &&
            (identical(other.caretPosition, caretPosition) ||
                other.caretPosition == caretPosition) &&
            (identical(other.caretRect, caretRect) ||
                other.caretRect == caretRect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, caretPosition, caretRect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CaretStateCopyWith<_$_CaretState> get copyWith =>
      __$$_CaretStateCopyWithImpl<_$_CaretState>(this, _$identity);
}

abstract class _CaretState implements CaretState {
  const factory _CaretState(
      {required final int caretPosition,
      required final Rect caretRect}) = _$_CaretState;

  @override
  int get caretPosition;
  @override
  Rect get caretRect;
  @override
  @JsonKey(ignore: true)
  _$$_CaretStateCopyWith<_$_CaretState> get copyWith =>
      throw _privateConstructorUsedError;
}
