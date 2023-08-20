import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/viewmodels/editor_texteditingcontroller.dart';

/// Properties to be passed to the viewmodel
///
/// [GlobalKey] to access text's [RenderParagraph],
/// [FocusNode] to control input focus,
/// [EditorTextEditingController] to handle input and styling,
/// and [Id] to identify the text document in the database.
typedef EditorProps = ({
  GlobalKey textFieldKey,
  FocusNode textFieldFocusNode,
  EditorTextEditingController textEditingController,
  Id? blockId,
});
