import 'package:isar/isar.dart';

abstract class ContainerModel {
  /// Unique identifier for this thread.
  ///
  /// Automatically assigned by the database.
  final Id id;

  /// Ordered list of [Id]'s for each child Block.
  final List<Id> children;

  ContainerModel({required this.id, required this.children});
}
