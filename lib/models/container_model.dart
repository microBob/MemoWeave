import 'package:isar/isar.dart';

/// Model for collections that contain other collections.
abstract class ParentModel {
  /// Unique identifier for this parent container.
  ///
  /// Automatically assigned by the database.
  final Id id;

  /// Ordered list of [Id]'s for each child BlockCollection.
  final List<Id> childIds;

  /// Constructor.
  ParentModel({this.id = Isar.autoIncrement, required this.childIds});

  /// Create a copy of this collection with updated [childIds].
  ParentModel copyWith({List<Id>? childIds});
}
