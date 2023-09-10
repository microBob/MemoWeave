import 'dart:ui';

import 'package:isar/isar.dart';

class CaretState {
  final int caretPosition;
  final Id idOfBlockInFocus;
  final bool setFromFocusChange;
  final Rect caretRect;

  CaretState({
    required this.caretPosition,
    required this.idOfBlockInFocus,
    required this.setFromFocusChange,
    required this.caretRect,
  });

  CaretState copyWith({
    int? caretPosition,
    Id? idOfBlockInFocus,
    bool? setFromFocusChange,
    Rect? caretRect,
  }) {
    return CaretState(
      caretPosition: caretPosition ?? this.caretPosition,
      idOfBlockInFocus: idOfBlockInFocus ?? this.idOfBlockInFocus,
      setFromFocusChange: setFromFocusChange ?? this.setFromFocusChange,
      caretRect: caretRect ?? this.caretRect,
    );
  }
}
