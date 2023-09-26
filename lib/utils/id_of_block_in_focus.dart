import 'package:isar/isar.dart';
import 'package:memoweave/models/id_of_block_in_focus_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'id_of_block_in_focus.g.dart';

@riverpod
class IdOfBlockInFocus extends _$IdOfBlockInFocus {
  @override
  IdOfBlockInFocusState build() {
    return const IdOfBlockInFocusState(
      blockId: -1,
      setFromTraversal: false,
    );
  }

  void update({Id? blockId, bool? setFromTraversal}) {
    state = state.copyWith(
      blockId: blockId ?? state.blockId,
      setFromTraversal: setFromTraversal ?? state.setFromTraversal,
    );
  }
}
