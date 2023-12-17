import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memoweave/models/block_collection.dart';

import '../viewmodels/block_texteditingcontroller.dart';

part 'block_texteditingcontroller_props.freezed.dart';

@freezed
class BlockTextEditingControllerProps with _$BlockTextEditingControllerProps {
  const factory BlockTextEditingControllerProps({
    required BlockCollection blockCollection,
    required Function(
      BlockCollection,
      BlockTextEditingController,
    ) onBlockTextEditingControllerChangedCallback,
  }) = _BlockTextEditingControllerProps;
}
