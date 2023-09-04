import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/database_props.dart';

class BlockState {
  final BlockCollection blockCollection;

  BlockState({
    required this.blockCollection,
  });

  BlockState copyWith({
    DatabaseProps? databaseProps,
    BlockCollection? blockCollection,
  }) {
    return BlockState(
      blockCollection: blockCollection ?? this.blockCollection,
    );
  }
}
