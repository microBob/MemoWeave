// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_callback_props.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlockCallbackProps {
  BlockCollection get blockCollection => throw _privateConstructorUsedError;

  BlockTextEditingController get blockTextEditingController =>
      throw _privateConstructorUsedError;

  RenderEditable get blockRenderEditable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockCallbackPropsCopyWith<BlockCallbackProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockCallbackPropsCopyWith<$Res> {
  factory $BlockCallbackPropsCopyWith(
          BlockCallbackProps value, $Res Function(BlockCallbackProps) then) =
      _$BlockCallbackPropsCopyWithImpl<$Res, BlockCallbackProps>;

  @useResult
  $Res call(
      {BlockCollection blockCollection,
      BlockTextEditingController blockTextEditingController,
      RenderEditable blockRenderEditable});
}

/// @nodoc
class _$BlockCallbackPropsCopyWithImpl<$Res, $Val extends BlockCallbackProps>
    implements $BlockCallbackPropsCopyWith<$Res> {
  _$BlockCallbackPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockCollection = null,
    Object? blockTextEditingController = null,
    Object? blockRenderEditable = null,
  }) {
    return _then(_value.copyWith(
      blockCollection: null == blockCollection
          ? _value.blockCollection
          : blockCollection // ignore: cast_nullable_to_non_nullable
              as BlockCollection,
      blockTextEditingController: null == blockTextEditingController
          ? _value.blockTextEditingController
          : blockTextEditingController // ignore: cast_nullable_to_non_nullable
              as BlockTextEditingController,
      blockRenderEditable: null == blockRenderEditable
          ? _value.blockRenderEditable
          : blockRenderEditable // ignore: cast_nullable_to_non_nullable
              as RenderEditable,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockCallbackPropsImplCopyWith<$Res>
    implements $BlockCallbackPropsCopyWith<$Res> {
  factory _$$BlockCallbackPropsImplCopyWith(_$BlockCallbackPropsImpl value,
          $Res Function(_$BlockCallbackPropsImpl) then) =
      __$$BlockCallbackPropsImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {BlockCollection blockCollection,
      BlockTextEditingController blockTextEditingController,
      RenderEditable blockRenderEditable});
}

/// @nodoc
class __$$BlockCallbackPropsImplCopyWithImpl<$Res>
    extends _$BlockCallbackPropsCopyWithImpl<$Res, _$BlockCallbackPropsImpl>
    implements _$$BlockCallbackPropsImplCopyWith<$Res> {
  __$$BlockCallbackPropsImplCopyWithImpl(_$BlockCallbackPropsImpl _value,
      $Res Function(_$BlockCallbackPropsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockCollection = null,
    Object? blockTextEditingController = null,
    Object? blockRenderEditable = null,
  }) {
    return _then(_$BlockCallbackPropsImpl(
      blockCollection: null == blockCollection
          ? _value.blockCollection
          : blockCollection // ignore: cast_nullable_to_non_nullable
              as BlockCollection,
      blockTextEditingController: null == blockTextEditingController
          ? _value.blockTextEditingController
          : blockTextEditingController // ignore: cast_nullable_to_non_nullable
              as BlockTextEditingController,
      blockRenderEditable: null == blockRenderEditable
          ? _value.blockRenderEditable
          : blockRenderEditable // ignore: cast_nullable_to_non_nullable
              as RenderEditable,
    ));
  }
}

/// @nodoc

class _$BlockCallbackPropsImpl implements _BlockCallbackProps {
  const _$BlockCallbackPropsImpl(
      {required this.blockCollection,
      required this.blockTextEditingController,
      required this.blockRenderEditable});

  @override
  final BlockCollection blockCollection;
  @override
  final BlockTextEditingController blockTextEditingController;
  @override
  final RenderEditable blockRenderEditable;

  @override
  String toString() {
    return 'BlockCallbackProps(blockCollection: $blockCollection, blockTextEditingController: $blockTextEditingController, blockRenderEditable: $blockRenderEditable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockCallbackPropsImpl &&
            (identical(other.blockCollection, blockCollection) ||
                other.blockCollection == blockCollection) &&
            (identical(other.blockTextEditingController,
                    blockTextEditingController) ||
                other.blockTextEditingController ==
                    blockTextEditingController) &&
            (identical(other.blockRenderEditable, blockRenderEditable) ||
                other.blockRenderEditable == blockRenderEditable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blockCollection,
      blockTextEditingController, blockRenderEditable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockCallbackPropsImplCopyWith<_$BlockCallbackPropsImpl> get copyWith =>
      __$$BlockCallbackPropsImplCopyWithImpl<_$BlockCallbackPropsImpl>(
          this, _$identity);
}

abstract class _BlockCallbackProps implements BlockCallbackProps {
  const factory _BlockCallbackProps(
          {required final BlockCollection blockCollection,
          required final BlockTextEditingController blockTextEditingController,
          required final RenderEditable blockRenderEditable}) =
      _$BlockCallbackPropsImpl;

  @override
  BlockCollection get blockCollection;

  @override
  BlockTextEditingController get blockTextEditingController;

  @override
  RenderEditable get blockRenderEditable;

  @override
  @JsonKey(ignore: true)
  _$$BlockCallbackPropsImplCopyWith<_$BlockCallbackPropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
