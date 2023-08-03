import 'package:uuid/uuid.dart';

class BlockModel {
  String id = const Uuid().v4();
  String text = '';
  String style = '';
  List<BlockModel> children = [];

  /// Default constructor
  BlockModel.empty();

  /// Parameterized constructor
  BlockModel({this.text = '', this.style = '', this.children = const []});
}
