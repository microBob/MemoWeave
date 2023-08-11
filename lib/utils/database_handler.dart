import 'package:isar/isar.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_handler.g.dart';

@riverpod
class DatabaseHandler extends _$DatabaseHandler {
  late Isar _isar;

  @override
  FutureOr<Isar> build() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([BlockCollectionSchema], directory: dir.path);
    return _isar;
  }
}
