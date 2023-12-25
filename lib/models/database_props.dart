import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/utils/database.dart';

part 'database_props.freezed.dart';

/// Properties for a Thread or Block's access to the database.
///
/// Provides the [id] of the Thread or Block,
/// and the [databaseManager] of the database.
@freezed
class DatabaseProps with _$DatabaseProps {
  const factory DatabaseProps({
    required Id id,
    required DatabaseManager databaseManager,
  }) = _DatabaseProps;
}
