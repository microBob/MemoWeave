import 'dart:ui';

import 'package:memoweave/models/caret_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'caret_viewmodel.g.dart';

@riverpod
class CaretViewModel extends _$CaretViewModel {
  @override
  CaretState build() {
    return const CaretState(
      caretTextOffset: 0,
      caretLocalRect: Rect.zero,
      caretGlobalPosition: Offset.zero,
    );
  }

  void update({
    final int? caretTextOffset,
    final Rect? caretLocalRect,
    final Offset? caretGlobalPosition,
  }) {
    state = state.copyWith(
      caretTextOffset: caretTextOffset ?? state.caretTextOffset,
      caretLocalRect: caretLocalRect ?? state.caretLocalRect,
      caretGlobalPosition: caretGlobalPosition ?? state.caretGlobalPosition,
    );
  }
}
