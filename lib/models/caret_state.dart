import 'dart:ui';

class CaretState {
  final int caretPosition;
  final bool setFromFocusChange;
  final Rect caretRect;

  CaretState({
    required this.caretPosition,
    required this.setFromFocusChange,
    required this.caretRect,
  });

  CaretState copyWith({
    int? caretPosition,
    bool? setFromFocusChange,
    Rect? caretRect,
  }) {
    return CaretState(
      caretPosition: caretPosition ?? this.caretPosition,
      setFromFocusChange: setFromFocusChange ?? this.setFromFocusChange,
      caretRect: caretRect ?? this.caretRect,
    );
  }
}
