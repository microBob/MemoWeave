import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'caret_state.freezed.dart';

@freezed
class CaretState with _$CaretState {
  const factory CaretState({
    required int caretTextOffset,
    required Rect caretLocalRect,
    required Offset caretGlobalPosition,
  }) = _CaretState;
}
