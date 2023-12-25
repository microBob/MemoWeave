import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memoweave/models/block_collection.dart';

import '../viewmodels/block_texteditingcontroller.dart';

part 'block_texteditingcontroller_props.freezed.dart';

/// Properties for a [BlockTextEditingController].
///
/// Provides the Block's [blockCollection],
/// and passes the [onBlockTextEditingControllerChangedCallback] to be
/// attached to the [BlockTextEditingController]'s change notifier.
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
