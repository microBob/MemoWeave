import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../viewmodels/block_texteditingcontroller.dart';
import 'block_collection.dart';

part 'block_callback_props.freezed.dart';

/// Properties Blocks pass up in callbacks.
@freezed
class BlockCallbackProps with _$BlockCallbackProps {
  /// Constructor for BlockCallbackProps.
  ///
  /// [blockCollection] using a callback,
  /// Block's [blockTextEditingController],
  /// and Block's [blockRenderEditable] getter function.
  const factory BlockCallbackProps({
    required BlockCollection blockCollection,
    required BlockTextEditingController blockTextEditingController,
    required ValueGetter<RenderEditable> blockRenderEditable,
  }) = _BlockCallbackProps;
}
