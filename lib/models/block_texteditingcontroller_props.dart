import 'package:freezed_annotation/freezed_annotation.dart';

import '../viewmodels/block_texteditingcontroller.dart';
import 'block_collection.dart';

part 'block_texteditingcontroller_props.freezed.dart';

/// Properties for a [BlockTextEditingController].
@freezed
class BlockTextEditingControllerProps with _$BlockTextEditingControllerProps {
  /// Properties for a [BlockTextEditingController].
  ///
  /// Provides the Block's [blockCollection],
  /// and passes the [onBlockTextEditingControllerChangedCallback] to be
  /// attached to the [BlockTextEditingController]'s change notifier.
  const factory BlockTextEditingControllerProps({
    required BlockCollection blockCollection,
    required Function(
      BlockCollection,
      BlockTextEditingController,
    ) onBlockTextEditingControllerChangedCallback,
  }) = _BlockTextEditingControllerProps;
}
