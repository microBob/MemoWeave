import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

/// Properties to be passed to the viewmodel
///
/// [GlobalKey] to access text's [RenderParagraph],
/// [FocusNode] to control input focus,
/// [TextEditingController] to handle input,
/// and [Id] to identify the text document in the database.
typedef EditorProps = ({
  GlobalKey textKey,
  FocusNode keyboardFocusNode,
  TextEditingController textEditingController,
  Id? blockId,
});
