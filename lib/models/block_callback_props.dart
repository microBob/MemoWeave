import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';

part 'block_callback_props.freezed.dart';

@freezed
class BlockCallbackProps with _$BlockCallbackProps {
  const factory BlockCallbackProps({
    required BlockCollection blockCollection,
    required BlockTextEditingController blockTextEditingController,
    required ValueGetter<RenderEditable> blockRenderEditable,
  }) = _BlockCallbackProps;
}
