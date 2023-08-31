import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/block_collection.dart';

part 'thread_collection.g.dart';

/// Collection definition for a thread.
@collection
class ThreadCollection {
  /// Unique identifier for this thread.
  ///
  /// Automatically assigned by the database.
  final Id id = Isar.autoIncrement;

  /// The spool this thread is part of.
  final String spool;

  /// Subject line for this thread.
  ///
  /// Defaults to the current [DateTime] as a string.
  final String subject;

  /// [DateTime] for this thread.
  ///
  /// Will default to the current [DateTime] at creation.
  final DateTime dateTime;

  /// Ordered set of [BlockCollection] objects that make up the content of this
  /// thread.
  final List<Id> blocks;

  /// Default constructor.
  ///
  /// Defines [id], [spool], [subject], and [dateTime].
  /// Will supply default values if none are given.
  ThreadCollection({
    this.spool = '',
    this.subject = '',
    required this.dateTime,
    this.blocks = const [],
  }) {
    if (blocks.isEmpty) {
      blocks.add(1);
      blocks.add(2);
      blocks.add(3);
    }
  }

  /// Copy builder.
  ///
  /// Creates a copy of the current Thread and updates the fields to
  /// [id], [spool], [subject], [dateTime], and [blocks] when provided.
  ThreadCollection copyWith({
    Id? id,
    String? spool,
    String? subject,
    DateTime? dateTime,
    List<Id>? blocks,
  }) {
    return ThreadCollection(
      spool: spool ?? this.spool,
      subject: subject ?? this.subject,
      dateTime: dateTime ?? this.dateTime,
      blocks: blocks ?? this.blocks,
    );
  }

  String dateTimeAsDate() => DateFormat.yMMMMEEEEd().format(dateTime);

  String dateTimeAsTime(BuildContext context) =>
      MediaQuery.of(context).alwaysUse24HourFormat
          ? DateFormat.Hm().format(dateTime)
          : DateFormat.jm().format(dateTime);

  @override
  String toString() {
    return 'Thread $id: "$subject"';
  }
}
