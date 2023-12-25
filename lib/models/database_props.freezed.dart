// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database_props.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DatabaseProps {
  int get id => throw _privateConstructorUsedError;

  DatabaseManager get databaseManager => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DatabasePropsCopyWith<DatabaseProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabasePropsCopyWith<$Res> {
  factory $DatabasePropsCopyWith(
          DatabaseProps value, $Res Function(DatabaseProps) then) =
      _$DatabasePropsCopyWithImpl<$Res, DatabaseProps>;

  @useResult
  $Res call({int id, DatabaseManager databaseManager});
}

/// @nodoc
class _$DatabasePropsCopyWithImpl<$Res, $Val extends DatabaseProps>
    implements $DatabasePropsCopyWith<$Res> {
  _$DatabasePropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? databaseManager = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      databaseManager: null == databaseManager
          ? _value.databaseManager
          : databaseManager // ignore: cast_nullable_to_non_nullable
              as DatabaseManager,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatabasePropsImplCopyWith<$Res>
    implements $DatabasePropsCopyWith<$Res> {
  factory _$$DatabasePropsImplCopyWith(
          _$DatabasePropsImpl value, $Res Function(_$DatabasePropsImpl) then) =
      __$$DatabasePropsImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({int id, DatabaseManager databaseManager});
}

/// @nodoc
class __$$DatabasePropsImplCopyWithImpl<$Res>
    extends _$DatabasePropsCopyWithImpl<$Res, _$DatabasePropsImpl>
    implements _$$DatabasePropsImplCopyWith<$Res> {
  __$$DatabasePropsImplCopyWithImpl(
      _$DatabasePropsImpl _value, $Res Function(_$DatabasePropsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? databaseManager = null,
  }) {
    return _then(_$DatabasePropsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      databaseManager: null == databaseManager
          ? _value.databaseManager
          : databaseManager // ignore: cast_nullable_to_non_nullable
              as DatabaseManager,
    ));
  }
}

/// @nodoc

class _$DatabasePropsImpl implements _DatabaseProps {
  const _$DatabasePropsImpl({required this.id, required this.databaseManager});

  @override
  final int id;
  @override
  final DatabaseManager databaseManager;

  @override
  String toString() {
    return 'DatabaseProps(id: $id, databaseManager: $databaseManager)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabasePropsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.databaseManager, databaseManager) ||
                other.databaseManager == databaseManager));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, databaseManager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabasePropsImplCopyWith<_$DatabasePropsImpl> get copyWith =>
      __$$DatabasePropsImplCopyWithImpl<_$DatabasePropsImpl>(this, _$identity);
}

abstract class _DatabaseProps implements DatabaseProps {
  const factory _DatabaseProps(
      {required final int id,
      required final DatabaseManager databaseManager}) = _$DatabasePropsImpl;

  @override
  int get id;

  @override
  DatabaseManager get databaseManager;

  @override
  @JsonKey(ignore: true)
  _$$DatabasePropsImplCopyWith<_$DatabasePropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
