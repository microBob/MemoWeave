import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'id_of_block_in_focus_state.freezed.dart';

@freezed
class IdOfBlockInFocusState with _$IdOfBlockInFocusState {
  const factory IdOfBlockInFocusState({
    required Id blockId,
    required bool setFromTraversal,
  }) = _IdOfBlockInFocusState;
}
