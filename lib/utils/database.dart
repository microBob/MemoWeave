import 'package:isar/isar.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/thread_collection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

/// Database manager class.
///
/// Handles opening and input/output.
class DatabaseManager {
  /// Reference to open database.
  final Isar _isar;

  /// Constructor defining the open database.
  DatabaseManager(Isar isar) : _isar = isar;

  /// Getter function for Blocks by [id].
  Future<BlockCollection?> getBlockCollectionById(Id id) async {
    return _isar.blockCollections.get(id);
  }

  /// Setter function for the given [blockCollection].
  ///
  /// Will add to the database if it's new or update an existing record.
  Future<void> putBlockCollection(BlockCollection blockCollection) async {
    await _isar.writeTxn(() async {
      await _isar.blockCollections.put(blockCollection);
    });
  }

  /// Get all spool names.
  Future<List<String>> get spools async {
    return await _isar.threadCollections.where().spoolProperty().findAll();
  }
}

/// Provider for the [Isar] database.
///
/// Primarily used by other providers that handle interaction.
@Riverpod(keepAlive: true)
Future<Isar> databaseInstance(DatabaseInstanceRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [
      BlockCollectionSchema,
      ThreadCollectionSchema,
    ],
    directory: dir.path,
  );
}

/// Provider for the instance of the [DatabaseManager].
///
/// Uses the current open [Isar] instance.
@riverpod
Future<DatabaseManager> databaseManager(DatabaseManagerRef ref) async {
  final isar = await ref.watch(databaseInstanceProvider.future);
  return DatabaseManager(isar);
}

/// Handles retrieving a [BlockCollection] with the given [Id].
///
/// Returns null if not found.
@riverpod
Future<BlockCollection?> getBlockCollectionById(GetBlockCollectionByIdRef ref,
    {required Id id}) async {
  final databaseManager = await ref.watch(databaseManagerProvider.future);
  return databaseManager.getBlockCollectionById(id);
}

/// Handles retrieving all spool names.
@riverpod
Future<List<String>> spools(SpoolsRef ref) async {
  final databaseManager = await ref.watch(databaseManagerProvider.future);
  return databaseManager.spools;
}