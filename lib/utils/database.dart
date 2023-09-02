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
  DatabaseManager({required Isar isar}) : _isar = isar;

  /// Getter function for Blocks by [id].
  BlockCollection? getBlockCollectionById(Id id) {
    return _isar.blockCollections.getSync(id);
  }

  /// Setter function for the given [blockCollection].
  ///
  /// Will add to the database if it's new or update an existing record.
  void putBlockCollection(BlockCollection blockCollection) {
    _isar.writeTxnSync(() {
      _isar.blockCollections.putSync(blockCollection);
    });
  }

  ThreadCollection? getThreadCollectionById(Id id) {
    return _isar.threadCollections.getSync(id);
  }

  void putThreadCollection(ThreadCollection threadCollection) {
    _isar.writeTxnSync(() {
      _isar.threadCollections.putSync(threadCollection);
    });
  }

  /// Get all spool names.
  Set<String> get spools {
    return _isar.threadCollections
        .where()
        .spoolProperty()
        .findAllSync()
        .toSet();
  }

  List<BlockCollection> getParentBlocksOfBlock(Id blockId) {
    return _isar.blockCollections
        .filter()
        .childrenBlockIdsElementEqualTo(blockId)
        .findAllSync();
  }

  List<ThreadCollection> getParentThreadsOfBlock(Id blockId) {
    return _isar.threadCollections
        .filter()
        .blockIdsElementEqualTo(blockId)
        .findAllSync();
  }
}

/// Provider for the instance of the [DatabaseManager].
///
/// Uses the current open [Isar] instance.
@Riverpod(keepAlive: true)
Future<DatabaseManager> databaseManager(DatabaseManagerRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      BlockCollectionSchema,
      ThreadCollectionSchema,
    ],
    directory: dir.path,
  );
  return DatabaseManager(isar: isar);
}
