import 'dart:async';

import 'package:drift/drift.dart';
import 'package:reviser/features/vocabulary/data/models/word/sqlite_dto_to_vocabulary_word_model_converter.dart';
import 'package:reviser/features/vocabulary/data/models/word/vocabulary_word_model.dart';
import 'package:reviser/features/vocabulary/data/sources/local/i_vocabulary_definition_local_data_source.dart';
import 'package:reviser/features/vocabulary/data/sources/local/i_vocabulary_word_local_data_source.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/tables/words_table.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/vocabulary_sqlite_database.dart';

part 'sqlite_word_local_data_source_impl.g.dart';

@DriftAccessor(tables: [Words])
final class VocabularySQLiteWordLocalDataSourceImpl
    extends DatabaseAccessor<VocabularySQLiteDatabase>
    with _$SQLiteWordLocalDataSourceImplMixin
    implements IVocabularyWordLocalDataSource {
  VocabularySQLiteWordLocalDataSourceImpl(
    VocabularySQLiteDatabase database, {
    required this.getterDefinitions,
  }) : super(database);

  final IVocabularyGetterDefinition getterDefinitions;

  @override
  FutureOr<void> deleteWordById(int id) {
    (delete(words)..where((w) => w.id.equals(id))).go();
  }

  @override
  FutureOr<List<VocabularyWordModel>> getAllWords() async {
    return select(words).asyncMap((w) async {
      final allDefinitions = await getterDefinitions.getAllDefinitionsByWordId(
        w.id,
      );
      return w.toModel(allDefinitions);
    }).get();
  }

  @override
  FutureOr<void> insertWord(VocabularyWordModel word) async {
    into(words).insert(word.toSQLiteDTO());
  }
}
