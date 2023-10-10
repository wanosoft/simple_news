import 'package:drift/drift.dart';

/// Articles table definition, used to save articles in local storage.
@DataClassName('Articles')
class Articles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().nullable()();
  TextColumn get author => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get content => text().nullable()();
}
