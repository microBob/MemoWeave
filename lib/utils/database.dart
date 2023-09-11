import 'dart:io';

import 'package:isar/isar.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/container_model.dart';
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
  BlockCollection getBlockCollectionById(Id id) {
    final blockCollection = _isar.blockCollections.getSync(id);
    if (blockCollection == null) {
      throw FileSystemException('Failed to get Block with ID $id');
    }
    return blockCollection;
  }

  ThreadCollection getThreadCollectionById(Id id) {
    final threadCollection = _isar.threadCollections.getSync(id);
    if (threadCollection == null) {
      throw FileSystemException('Failed to get Thread with ID $id');
    }
    return threadCollection;
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

  Id? getIdOfBlockBefore(BlockCollection sourceBlockCollection) {
    // TODO: handle looking at child blocks
    final parentCollection = (sourceBlockCollection.hasThreadAsParent
            ? _isar.threadCollections
            : _isar.blockCollections)
        .getSync(sourceBlockCollection.parent);
    if (parentCollection == null) {
      throw FileSystemException(
          'Failed to get parent of Block ${sourceBlockCollection.id}: '
          'Parent ${sourceBlockCollection.parent}');
    }

    final sourceBlockIndex =
        parentCollection.childIds.indexOf(sourceBlockCollection.id);
    if (sourceBlockIndex == -1) {
      throw FormatException(
          'Block ${sourceBlockCollection.id} is not a child of '
          'parent ${sourceBlockCollection.parent}');
    }

    // No Block after as this is the last one.
    if (sourceBlockCollection.id == parentCollection.childIds.first) {
      return null;
    }

    // Get Block after
    return parentCollection.childIds[sourceBlockIndex - 1];
  }

  void deleteBlockCollection(BlockCollection blockCollection) {
    _isar.writeTxnSync(() {
      // Remove Block from parent's children ID list.
      final parentCollection = _getParentCollectionOf(blockCollection);
      final updatedParentCollectionChildIds = parentCollection.childIds.toList()
        ..remove(blockCollection.id);
      _getParentCollectionsOf(blockCollection).putSync(
          parentCollection.copyWith(childIds: updatedParentCollectionChildIds));

      // Delete collection.
      _isar.blockCollections.deleteSync(blockCollection.id);
    });
  }

  Id? getIdOfBlockAfter(BlockCollection sourceBlockCollection) {
    // TODO: handle looking at child blocks
    final parentCollection = _getParentCollectionOf(sourceBlockCollection);

    final sourceBlockIndex =
        parentCollection.childIds.indexOf(sourceBlockCollection.id);
    if (sourceBlockIndex == -1) {
      throw FormatException(
          'Block ${sourceBlockCollection.id} is not a child of '
          'parent ${sourceBlockCollection.parent}');
    }

    // No Block after as this is the last one.
    if (sourceBlockCollection.id == parentCollection.childIds.last) return null;

    // Get Block after
    return parentCollection.childIds[sourceBlockIndex + 1];
  }

  void insertBlockAfter({
    required BlockCollection sourceBlockCollection,
    BlockCollection? newBlockCollection,
  }) {
    // TODO: Handle inserting into children
    _isar.writeTxnSync(() {
      final newBlockId = _isar.blockCollections.putSync(
        newBlockCollection ??
            BlockCollection(
              parent: sourceBlockCollection.parent,
              hasThreadAsParent: sourceBlockCollection.hasThreadAsParent,
            ),
      );

      final parentCollections = _getParentCollectionsOf(sourceBlockCollection);

      final parentCollection = _getParentCollectionOf(sourceBlockCollection);
      final children = parentCollection.childIds.toList();
      children.insert(
        children.indexOf(sourceBlockCollection.id) + 1,
        newBlockId,
      );

      parentCollections.putSync(parentCollection.copyWith(childIds: children));
    });
  }

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

  IsarCollection<ContainerModel> _getParentCollectionsOf(
      BlockCollection blockCollection) {
    return blockCollection.hasThreadAsParent
        ? _isar.threadCollections
        : _isar.blockCollections;
  }

  ContainerModel _getParentCollectionOf(BlockCollection blockCollection) {
    final parentCollection = _getParentCollectionsOf(blockCollection)
        .getSync(blockCollection.parent);
    if (parentCollection == null) {
      throw FileSystemException(
          'Failed to get parent of Block ${blockCollection.id}: '
          'Parent ${blockCollection.parent}');
    }
    return parentCollection;
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
