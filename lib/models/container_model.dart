import 'package:isar/isar.dart';

abstract class ParentModel {
  /// Unique identifier for this parent container.
  ///
  /// Automatically assigned by the database.
  final Id id;

  /// Ordered list of [Id]'s for each child BlockCollection.
  final List<Id> childIds;

  ParentModel({this.id = Isar.autoIncrement, required this.childIds});

  ParentModel copyWith({List<Id>? childIds});
}
