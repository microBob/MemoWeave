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

  ThreadCollection? getThreadCollectionById(Id id) {
    return _isar.threadCollections.getSync(id);
  }

  Stream<BlockCollection?> onBlockChanged(Id id) {
    return _isar.blockCollections.watchObject(id);
  }

  Stream<void> onThreadChanged(Id id) {
    return _isar.threadCollections.watchObjectLazy(id);
  }

  /// Setter function for the given [blockCollection].
  ///
  /// Will add to the database if it's new or update an existing record.
  void putBlockCollection(BlockCollection blockCollection) {
    _isar.writeTxnSync(() {
      _isar.blockCollections.putSync(blockCollection);
    });
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

  void insertBlockAfter(Id blockId) {
    final blockParents = getParentBlocksOfBlock(blockId);
    final threadParents = getParentThreadsOfBlock(blockId);

    _isar.writeTxnSync(() {
      final newBlockId = _isar.blockCollections.putSync(BlockCollection());

      for (final blockParent in blockParents) {
        final childrenBlockIds = blockParent.childrenBlockIds.toList();
        childrenBlockIds.insert(
          childrenBlockIds.indexOf(blockId) + 1,
          newBlockId,
        );

        final newBlockParent =
            blockParent.copyWith(childrenBlockIds: childrenBlockIds);
        _isar.blockCollections.putSync(newBlockParent);
      }

      for (final threadParent in threadParents) {
        final blockIds = threadParent.blockIds.toList();
        blockIds.insert(
          blockIds.indexOf(blockId) + 1,
          newBlockId,
        );

        final newThreadParent = threadParent.copyWith(blockIds: blockIds);
        _isar.threadCollections.putSync(newThreadParent);
      }
    });
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
