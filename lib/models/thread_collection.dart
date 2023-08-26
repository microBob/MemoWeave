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
  /// Will lbe assigned by the database system if null.
  /// Not really used by the app and is mainly for the database system to index.
  Id? id;

  /// The spool this thread is part of.
  final String spool;

  /// Subject line for this thread.
  ///
  /// Defaults to the current [DateTime] as a string.
  final String subject;

  /// [DateTime] for this thread.
  ///
  /// Will default to the [DateTime] at creation.
  final DateTime dateTime;

  /// Ordered set of [BlockCollection] objects that make up the content of this
  /// thread.
  final IsarLinks<BlockCollection> blocks;

  /// Default constructor.
  ///
  /// Defines [id], [spool], [subject], [dateTime], and [blocks].
  /// Will supply default values if none are given.
  ThreadCollection({
    this.id,
    this.spool = '',
    this.subject = '',
    DateTime? inDateTime,
    IsarLinks<BlockCollection>? inBlocks,
  })  : dateTime = inDateTime ?? DateTime.now(),
        blocks = inBlocks ?? IsarLinks<BlockCollection>() {
    // Create a starting block if there are none.
    if (blocks.isEmpty) {
      blocks.add(BlockCollection());
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
    IsarLinks<BlockCollection>? blocks,
  }) {
    return ThreadCollection(
      id: id ?? this.id,
      spool: spool ?? this.spool,
      subject: subject ?? this.subject,
      inDateTime: dateTime ?? this.dateTime,
      inBlocks: blocks ?? this.blocks,
    );
  }

  String get dateTimeAsDate => DateFormat.yMMMMEEEEd().format(dateTime);

  String dateTimeAsTime(BuildContext context) =>
      MediaQuery.of(context).alwaysUse24HourFormat
          ? DateFormat.Hm().format(dateTime)
          : DateFormat.jm().format(dateTime);
}
