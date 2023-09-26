import 'dart:ui';

import 'package:memoweave/models/caret_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'caret_viewmodel.g.dart';

@riverpod
class CaretViewModel extends _$CaretViewModel {
  @override
  CaretState build() {
    return const CaretState(
      caretPosition: 0,
      caretRect: Rect.zero,
    );
  }

  void update({
    final int? caretPosition,
    final Rect? caretRect,
  }) {
    state = state.copyWith(
      caretPosition: caretPosition ?? state.caretPosition,
      caretRect: caretRect ?? state.caretRect,
    );
  }
}
