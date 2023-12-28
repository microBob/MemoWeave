import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import '../utils/database.dart';

part 'database_props.freezed.dart';

/// Database Properties.
///
/// Properties for a Thread or Block's access to the database.
@freezed
class DatabaseProps with _$DatabaseProps {
  /// Database Properties.
  ///
  /// Provides the [id] of the Thread or Block,
  /// and the [databaseManager] of the database.
  const factory DatabaseProps({
    required Id id,
    required DatabaseManager databaseManager,
  }) = _DatabaseProps;
}
