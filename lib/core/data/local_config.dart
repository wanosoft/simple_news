import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// ignore: unused_import
import '../../features/articles/data/models/articles.dart';

part 'local_config.g.dart';

typedef GetDocumentsDirectory = Future<Directory> Function();

@Riverpod(keepAlive: true)
GetDocumentsDirectory getDocumentsDirectory(GetDocumentsDirectoryRef ref) =>
    getApplicationDocumentsDirectory;

@Riverpod(keepAlive: true)
QueryExecutor queryExecutor(QueryExecutorRef ref) {
  final getDocumentsDirectory = ref.watch(getDocumentsDirectoryProvider);

  return LazyDatabase(() async {
    final dbFolder = await getDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@Riverpod(keepAlive: true)
SimpleNewsDatabase simpleNewsDatabase(SimpleNewsDatabaseRef ref) {
  final queryExecutor = ref.watch(queryExecutorProvider);
  return SimpleNewsDatabase(queryExecutor);
}

@DriftDatabase(tables: [Articles])
class SimpleNewsDatabase extends _$SimpleNewsDatabase {
  SimpleNewsDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
