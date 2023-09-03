import 'dart:async';

import 'package:drift/drift.dart';
import 'package:reviser/features/vocabulary/data/models/definition/sqlite_dto_to_vocabulary_definition_model_converter.dart';
import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_model.dart';
import 'package:reviser/features/vocabulary/data/sources/local/i_vocabulary_definition_local_data_source.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/tables/definitions_table.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/vocabulary_sqlite_database.dart';

part 'vocabulary_sqlite_definition_local_data_source_impl.g.dart';

@DriftAccessor(tables: [Definitions])
final class VocabularySQLiteDefinitionLocalDataSourceImpl
    extends DatabaseAccessor<VocabularySQLiteDatabase>
    with _$SQLiteDefinitionLocalDataSourceImplMixin
    implements IVocabularyDefinitionLocalDataSource {
  /// Used to manipulate with the data that refers to the [definitions] table
  VocabularySQLiteDefinitionLocalDataSourceImpl(
    VocabularySQLiteDatabase database,
  ) : super(database);

  @override
  FutureOr<void> deleteDefinitionById(int id) {
    (delete(definitions)..where((d) => d.id.equals(id))).go();
  }

  @override
  Future<void> upsertDefinition(VocabularyDefinitionModel definition) async {
    final d = definition.toSQLiteDTO();
    into(definitions).insertOnConflictUpdate(d);
  }

  @override
  Future<List<VocabularyDefinitionModel>> getAllDefinitionsByWordId(
    int id,
  ) async {
    final allDefinitions =
        await (select(definitions)..where((d) => d.id.equals(id))).get();
    return allDefinitions.map((e) => e.toModel()).toList();
  }
}
  