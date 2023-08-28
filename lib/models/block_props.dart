import 'package:flutter/material.dart';
import 'package:memoweave/models/block_collection.dart';

/// Properties to be passed to [BlockViewModel].
///
/// [GlobalKey] to access [TextField]'s [RenderEditable] and
/// [BlockCollection] with loaded data for this Block.
typedef BlockProps = ({
  GlobalKey textFieldKey,
  BlockCollection blockCollection,
});
