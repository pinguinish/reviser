import 'dart:async';

import 'package:reviser/features/vocabulary/data/models/word/sqlite_dto_to_vocabulary_word_model_converter.dart';
import 'package:reviser/features/vocabulary/data/models/word/vocabulary_word_model.dart';
import 'package:reviser/features/vocabulary/data/sources/local/i_vocabulary_word_local_data_source.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/vocabulary_sqlite_database.dart';

class VocabularyWordLocalDataSourceImpl
    implements IVocabularyWordLocalDataSource {
  const VocabularyWordLocalDataSourceImpl(this._db);

  final VocabularySQLiteDatabase _db;

  @override
  FutureOr<void> deleteWordById(int id) {
    try {
      (_db.delete(_db.words)..where((w) => w.id.equals(id))).go();
    } on Object {
      rethrow;
    }
  }

  @override
  FutureOr<List<VocabularyWordModel>> getAllWords() async {
    try {
      return _db.select(_db.words).asyncMap((w) async {
        return w.toModel();
      }).get();
    } on Object {
      rethrow;
    }
  }

  @override
  FutureOr<VocabularyWordModel> insertWord(VocabularyWordModel word) async {
    try {
      final dto = await _db.into(_db.words).insertReturning(word.toSQLiteDTO());
      return dto.toModel();
    } on Object {
      rethrow;
    }
  }
}
