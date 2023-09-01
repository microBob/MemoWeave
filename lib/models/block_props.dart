import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

/// Properties to be passed to [BlockViewModel].
///
/// [GlobalKey] to access [TextField]'s [RenderEditable] and
/// [Id] to fetch the Block from the database.
typedef BlockProps = ({
  GlobalKey textFieldKey,
  Id blockId,
});
