import 'package:isar/isar.dart';
import 'package:memoweave/models/container_model.dart';

part 'thread_collection.g.dart';

/// Collection definition for a thread.
@collection
class ThreadCollection extends ParentModel {
  /// The spool this thread is part of.
  final String spool;

  /// Subject line for this thread.
  ///
  /// Defaults to the current [DateTime] as a string.
  final String subject;

  /// [DateTime] for this thread.
  final DateTime dateTime;

  /// Default constructor.
  ///
  /// Defines [id], [spool], [subject], and [dateTime].
  /// Will supply default values if none are given.
  ThreadCollection({
    super.id = Isar.autoIncrement,
    super.childIds = const [],
    this.spool = '',
    this.subject = '',
    required this.dateTime,
  });

  /// Copy builder.
  ///
  /// Creates a copy of the current Thread and updates the fields to
  /// [id], [spool], [subject], [dateTime], and [blockIds] when provided.
  @override
  ThreadCollection copyWith({
    List<Id>? childIds,
    Id? parent,
    String? spool,
    String? subject,
    DateTime? dateTime,
  }) {
    return ThreadCollection(
      id: super.id,
      childIds: childIds ?? super.childIds,
      spool: spool ?? this.spool,
      subject: subject ?? this.subject,
      dateTime: dateTime ?? this.dateTime,
    );
  }


  @override
  String toString() {
    return 'Thread $id: "$subject"';
  }
}
