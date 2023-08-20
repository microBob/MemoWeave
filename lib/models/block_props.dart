import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';

/// Properties to be passed to the ViewModel.
///
/// [GlobalKey] to access [TextField]'s [RenderEditable],
/// [FocusNode] to control input focus,
/// [BlockTextEditingController] to handle input and styling,
/// and [Id] to identify the text document in the database.
typedef BlockProps = ({
  GlobalKey textFieldKey,
  FocusNode textFieldFocusNode,
  BlockTextEditingController textEditingController,
  Id? blockId,
});
