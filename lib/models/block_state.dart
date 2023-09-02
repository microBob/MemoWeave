import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';

class BlockState {
  final DatabaseProps databaseProps;
  final BlockTextEditingController blockTextEditingController;
  final BlockCollection blockCollection;

  BlockState({
    required this.databaseProps,
    required this.blockTextEditingController,
    required this.blockCollection,
  });

  BlockState copyWith({
    DatabaseProps? databaseProps,
    BlockTextEditingController? blockTextEditingController,
    BlockCollection? blockCollection,
  }) {
    return BlockState(
      databaseProps: databaseProps ?? this.databaseProps,
      blockTextEditingController:
          blockTextEditingController ?? this.blockTextEditingController,
      blockCollection: blockCollection ?? this.blockCollection,
    );
  }
}
