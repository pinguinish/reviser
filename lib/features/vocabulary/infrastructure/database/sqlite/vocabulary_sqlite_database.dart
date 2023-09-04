import 'package:drift/drift.dart';
import 'package:reviser/features/common/core/part_of_speech.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/connection/connection.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/tables/definitions_table.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/tables/words_table.dart';

part 'vocabulary_sqlite_database.g.dart';

@DriftDatabase(tables: [Words, Definitions])
class VocabularySQLiteDatabase extends _$VocabularySQLiteDatabase {
  VocabularySQLiteDatabase() : super(connect());

  @override
  int get schemaVersion => 1;
}


