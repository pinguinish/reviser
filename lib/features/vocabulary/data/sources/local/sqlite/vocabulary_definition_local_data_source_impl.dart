import 'package:reviser/features/vocabulary/data/models/definition/sqlite_dto_to_vocabulary_definition_model_converter.dart';
import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_model.dart';
import 'package:reviser/features/vocabulary/data/sources/local/i_vocabulary_definition_local_data_source.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/vocabulary_sqlite_database.dart';

final class VocabularyDefinitionLocalDataSourceImpl
    implements IVocabularyDefinitionLocalDataSource {
  const VocabularyDefinitionLocalDataSourceImpl(this._db);

  final VocabularySQLiteDatabase _db;

  @override
  Future<void> deleteAllDefinitionsByWordId(int id) async {
    try {
      (_db.delete(_db.definitions)..where((d) => d.wordId.equals(id))).go();
    } on Object {
      rethrow;
    }
  }

  @override
  Future<void> deleteDefinitionById(int id) async {
    try {
      (_db.delete(_db.definitions)..where((d) => d.id.equals(id))).go();
    } on Object {
      rethrow;
    }
  }

  @override
  Future<List<VocabularyDefinitionModel>> getAllDefinitionsByWordId(
    int id,
  ) async {
    try {
      final dto = await (_db.select(_db.definitions)
            ..where(
              (d) => d.wordId.equals(id),
            ))
          .get();
      return dto.map((d) => d.toModel()).toList();
    } on Object {
      rethrow;
    }
  }

  @override
  Future<VocabularyDefinitionModel> upsertDefinition(
    VocabularyDefinitionModel definition,
  ) async {
    try {
      final dto = await _db
          .into(_db.definitions)
          .insertReturning(definition.toSQLiteDTO());
      return dto.toModel();
    } on Object {
      rethrow;
    }
  }
}
