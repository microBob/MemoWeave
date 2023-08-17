import 'package:isar/isar.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_handler.g.dart';

/// Opens and handles writing to database.
@riverpod
class DatabaseHandler extends _$DatabaseHandler {
  late Isar _isar;

  /// Open Isar database.
  ///
  /// Sets [_isar] to the open instance
  @override
  FutureOr<Isar> build() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([BlockCollectionSchema], directory: dir.path);
    return _isar;
  }
}

/// Returns a [BlockCollection] with the given [id]
@riverpod
Future<BlockCollection?> blockCollectionById(BlockCollectionByIdRef ref,
    {required Id id}) {
  return ref.watch(databaseHandlerProvider).when(
      data: (isar) {
        return isar.blockCollections.get(id);
      },
      error: (error, frame) => Future(() => null),
      loading: () => Future(() => null));
}
