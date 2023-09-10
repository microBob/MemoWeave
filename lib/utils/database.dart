import 'dart:io';

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

  Stream<ThreadCollection?> onThreadChanged(Id id) {
    return _isar.threadCollections.watchObject(id);
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

  List<Id> get threadIds {
    return _isar.threadCollections.where().idProperty().findAllSync();
  }

  void insertBlockAfter({
    required BlockCollection sourceBlockCollection,
    BlockCollection? newBlockCollection,
  }) {
    _isar.writeTxnSync(() {
      final newBlockId = _isar.blockCollections.putSync(
        newBlockCollection ??
            BlockCollection(
              parent: sourceBlockCollection.parent,
              hasThreadAsParent: sourceBlockCollection.hasThreadAsParent,
            ),
      );

      final parentCollections = sourceBlockCollection.hasThreadAsParent
          ? _isar.threadCollections
          : _isar.blockCollections;

      final parentCollection =
          parentCollections.getSync(sourceBlockCollection.parent);
      if (parentCollection == null) {
        throw FileSystemException(
            'Failed to get parent of Block ${sourceBlockCollection.id}:'
            ' Thread ${sourceBlockCollection.parent}');
      }
      final children = parentCollection.childIds.toList();
      children.insert(
        children.indexOf(sourceBlockCollection.id) + 1,
        newBlockId,
      );

      parentCollections.putSync(parentCollection.copyWith(childIds: children));
    });
  }

  void mergeBlock({required final Id blockId}) {}

  void createNewThread() {
    _isar.writeTxnSync(() {
      final newThreadId = _isar.threadCollections
          .putSync(ThreadCollection(dateTime: DateTime.now()));
      final newBlockId = _isar.blockCollections.putSync(
          BlockCollection(parent: newThreadId, hasThreadAsParent: true));

      final newThread = _isar.threadCollections
          .getSync(newThreadId)!
          .copyWith(childIds: [newBlockId]);
      _isar.threadCollections.putSync(newThread);
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
