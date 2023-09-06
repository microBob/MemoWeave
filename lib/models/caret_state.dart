import 'dart:ui';

class CaretState {
  final int caretPosition;
  final Rect caretRect;

  CaretState({
    required this.caretPosition,
    required this.caretRect,
  });

  CaretState copyWith({
    int? caretPosition,
    Rect? caretRect,
  }) {
    return CaretState(
      caretPosition: caretPosition ?? this.caretPosition,
      caretRect: caretRect ?? this.caretRect,
    );
  }
}
