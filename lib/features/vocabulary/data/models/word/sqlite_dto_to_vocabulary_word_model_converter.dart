import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:reviser/features/common/core/utils/database.dart';
import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_model.dart';
import 'package:reviser/features/vocabulary/data/models/word/vocabulary_word_model.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/vocabulary_sqlite_database.dart';

extension SQLiteDTOToVocabularyWordModelConverter on Word {
  VocabularyWordModel toModel(List<VocabularyDefinitionModel> definitions) =>
      VocabularyWordModel(
        id: id,
        word: word,
        additionDate: additionDate,
        definitions: definitions,
      );
}

extension WordModelToSQLiteDTOVocabularyConverter on VocabularyWordModel {
  WordsCompanion toSQLiteDTO() {
    return WordsCompanion(
      id: getValueOrAbsent<int>(id),
      word: Value(word),
      additionDate: getValueOrAbsent(additionDate),
      definitionIds: Value(jsonEncode(definitions.map((e) => e.id))),
    );
  }
}
