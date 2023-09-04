import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reviser/features/common/core/part_of_speech.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/tables/definitions_table.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/tables/words_table.dart';

part 'vocabulary_sqlite_database.g.dart';

@DriftDatabase(tables: [Words, Definitions])
class VocabularySQLiteDatabase extends _$VocabularySQLiteDatabase {
  VocabularySQLiteDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection({String filename = "x.sqlite"}) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, filename));
    return NativeDatabase.createInBackground(file);
  });
}
