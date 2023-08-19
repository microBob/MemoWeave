import 'package:isar/isar.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

class DatabaseManager {
  final Isar _isar;

  DatabaseManager(Isar isar) : _isar = isar;

  Future<BlockCollection?> getBlockCollectionById(Id id) async {
    return _isar.blockCollections.get(id);
  }

  Future<void> putBlockCollection(BlockCollection blockCollection) async {
    await _isar.writeTxn(() async {
      await _isar.blockCollections.put(blockCollection);
    });
  }
}

/// Returns access to the [Isar] database.
///
/// Primarily used by other providers that handle interaction.
@Riverpod(keepAlive: true)
Future<Isar> databaseInstance(DatabaseInstanceRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open([BlockCollectionSchema], directory: dir.path);
}

@riverpod
Future<DatabaseManager> databaseManagerInstance(
    DatabaseManagerInstanceRef ref) async {
  final isar = await ref.watch(databaseInstanceProvider.future);
  return DatabaseManager(isar);
}

@riverpod
Future<BlockCollection?> getBlockCollectionById(GetBlockCollectionByIdRef ref,
    {required Id id}) async {
  final databaseManager =
      await ref.watch(databaseManagerInstanceProvider.future);
  return databaseManager.getBlockCollectionById(id);
}
