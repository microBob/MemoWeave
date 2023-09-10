import 'dart:ui';

import 'package:memoweave/models/caret_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'caret_viewmodel.g.dart';

@riverpod
class CaretViewModel extends _$CaretViewModel {
  @override
  CaretState build() {
    return CaretState(
      caretPosition: 0,
      idOfBlockInFocus: -1,
      setFromFocusChange: false,
      caretRect: Rect.zero,
    );
  }

  void updateCaret({
    final int? caretPosition,
    final int? idOfBlockInFocus,
    final bool? setFromFocusChange,
    final Rect? caretRect,
  }) {
    state = state.copyWith(
      caretPosition: caretPosition,
      idOfBlockInFocus: idOfBlockInFocus,
      setFromFocusChange: setFromFocusChange ?? false,
      caretRect: caretRect,
    );
  }
}
