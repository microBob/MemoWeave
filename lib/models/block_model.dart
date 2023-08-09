import 'package:uuid/uuid.dart';

/// Model for a text block
///
/// Manages the text, style, ID, and children
class BlockModel {
  /// Unique identifier for block
  String id = const Uuid().v4();

  /// Block contents
  String? text;

  /// Style for block's contents
  String? style;

  /// Children nodes
  List<BlockModel>? children = [];

  /// Default constructor
  BlockModel.empty();

  /// Text constructor
  BlockModel(this.text, {this.style});

  /// Children constructor
  BlockModel.join(this.children);
}
