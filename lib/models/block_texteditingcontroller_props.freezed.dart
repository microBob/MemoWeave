// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_texteditingcontroller_props.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlockTextEditingControllerProps {
  BlockCollection get blockCollection => throw _privateConstructorUsedError;
  dynamic Function(BlockCollection, BlockTextEditingController)
      get onBlockTextEditingControllerChangedCallback =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockTextEditingControllerPropsCopyWith<BlockTextEditingControllerProps>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockTextEditingControllerPropsCopyWith<$Res> {
  factory $BlockTextEditingControllerPropsCopyWith(
          BlockTextEditingControllerProps value,
          $Res Function(BlockTextEditingControllerProps) then) =
      _$BlockTextEditingControllerPropsCopyWithImpl<$Res,
          BlockTextEditingControllerProps>;
  @useResult
  $Res call(
      {BlockCollection blockCollection,
      dynamic Function(BlockCollection, BlockTextEditingController)
          onBlockTextEditingControllerChangedCallback});
}

/// @nodoc
class _$BlockTextEditingControllerPropsCopyWithImpl<$Res,
        $Val extends BlockTextEditingControllerProps>
    implements $BlockTextEditingControllerPropsCopyWith<$Res> {
  _$BlockTextEditingControllerPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockCollection = null,
    Object? onBlockTextEditingControllerChangedCallback = null,
  }) {
    return _then(_value.copyWith(
      blockCollection: null == blockCollection
          ? _value.blockCollection
          : blockCollection // ignore: cast_nullable_to_non_nullable
              as BlockCollection,
      onBlockTextEditingControllerChangedCallback: null ==
              onBlockTextEditingControllerChangedCallback
          ? _value.onBlockTextEditingControllerChangedCallback
          : onBlockTextEditingControllerChangedCallback // ignore: cast_nullable_to_non_nullable
              as dynamic Function(BlockCollection, BlockTextEditingController),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockTextEditingControllerPropsImplCopyWith<$Res>
    implements $BlockTextEditingControllerPropsCopyWith<$Res> {
  factory _$$BlockTextEditingControllerPropsImplCopyWith(
          _$BlockTextEditingControllerPropsImpl value,
          $Res Function(_$BlockTextEditingControllerPropsImpl) then) =
      __$$BlockTextEditingControllerPropsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlockCollection blockCollection,
      dynamic Function(BlockCollection, BlockTextEditingController)
          onBlockTextEditingControllerChangedCallback});
}

/// @nodoc
class __$$BlockTextEditingControllerPropsImplCopyWithImpl<$Res>
    extends _$BlockTextEditingControllerPropsCopyWithImpl<$Res,
        _$BlockTextEditingControllerPropsImpl>
    implements _$$BlockTextEditingControllerPropsImplCopyWith<$Res> {
  __$$BlockTextEditingControllerPropsImplCopyWithImpl(
      _$BlockTextEditingControllerPropsImpl _value,
      $Res Function(_$BlockTextEditingControllerPropsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockCollection = null,
    Object? onBlockTextEditingControllerChangedCallback = null,
  }) {
    return _then(_$BlockTextEditingControllerPropsImpl(
      blockCollection: null == blockCollection
          ? _value.blockCollection
          : blockCollection // ignore: cast_nullable_to_non_nullable
              as BlockCollection,
      onBlockTextEditingControllerChangedCallback: null ==
              onBlockTextEditingControllerChangedCallback
          ? _value.onBlockTextEditingControllerChangedCallback
          : onBlockTextEditingControllerChangedCallback // ignore: cast_nullable_to_non_nullable
              as dynamic Function(BlockCollection, BlockTextEditingController),
    ));
  }
}

/// @nodoc

class _$BlockTextEditingControllerPropsImpl
    implements _BlockTextEditingControllerProps {
  const _$BlockTextEditingControllerPropsImpl(
      {required this.blockCollection,
      required this.onBlockTextEditingControllerChangedCallback});

  @override
  final BlockCollection blockCollection;
  @override
  final dynamic Function(BlockCollection, BlockTextEditingController)
      onBlockTextEditingControllerChangedCallback;

  @override
  String toString() {
    return 'BlockTextEditingControllerProps(blockCollection: $blockCollection, onBlockTextEditingControllerChangedCallback: $onBlockTextEditingControllerChangedCallback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockTextEditingControllerPropsImpl &&
            (identical(other.blockCollection, blockCollection) ||
                other.blockCollection == blockCollection) &&
            (identical(other.onBlockTextEditingControllerChangedCallback,
                    onBlockTextEditingControllerChangedCallback) ||
                other.onBlockTextEditingControllerChangedCallback ==
                    onBlockTextEditingControllerChangedCallback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blockCollection,
      onBlockTextEditingControllerChangedCallback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockTextEditingControllerPropsImplCopyWith<
          _$BlockTextEditingControllerPropsImpl>
      get copyWith => __$$BlockTextEditingControllerPropsImplCopyWithImpl<
          _$BlockTextEditingControllerPropsImpl>(this, _$identity);
}

abstract class _BlockTextEditingControllerProps
    implements BlockTextEditingControllerProps {
  const factory _BlockTextEditingControllerProps(
          {required final BlockCollection blockCollection,
          required final dynamic Function(
                  BlockCollection, BlockTextEditingController)
              onBlockTextEditingControllerChangedCallback}) =
      _$BlockTextEditingControllerPropsImpl;

  @override
  BlockCollection get blockCollection;
  @override
  dynamic Function(BlockCollection, BlockTextEditingController)
      get onBlockTextEditingControllerChangedCallback;
  @override
  @JsonKey(ignore: true)
  _$$BlockTextEditingControllerPropsImplCopyWith<
          _$BlockTextEditingControllerPropsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
