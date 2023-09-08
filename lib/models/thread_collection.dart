import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/container_model.dart';

part 'thread_collection.g.dart';

/// Collection definition for a thread.
@collection
class ThreadCollection extends ContainerModel {
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

  /// Default constructor.
  ///
  /// Defines [id], [spool], [subject], and [dateTime].
  /// Will supply default values if none are given.
  ThreadCollection({
    super.id = Isar.autoIncrement,
    super.children = const [],
    this.spool = '',
    this.subject = '',
    required this.dateTime,
  });

  /// Copy builder.
  ///
  /// Creates a copy of the current Thread and updates the fields to
  /// [id], [spool], [subject], [dateTime], and [blockIds] when provided.
  ThreadCollection copyWith({
    Id? id,
    Id? parent,
    List<Id>? children,
    String? spool,
    String? subject,
    DateTime? dateTime,
  }) {
    return ThreadCollection(
      id: id ?? super.id,
      children: children ?? super.children,
      spool: spool ?? this.spool,
      subject: subject ?? this.subject,
      dateTime: dateTime ?? this.dateTime,
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
