import 'package:isar/isar.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

/// Returns access to the [Isar] database.
///
/// Primarily used by other providers that handle interaction.
@riverpod
Future<Isar> database(DatabaseRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open([BlockCollectionSchema], directory: dir.path);
}

/// Returns a [BlockCollection] with the given [id].
///
/// Will return null if unable to return.
@riverpod
Future<BlockCollection?> blockCollectionById(BlockCollectionByIdRef ref,
    {required Id id}) async {
  return ref.watch(databaseProvider).value?.blockCollections.get(id);
}
