import 'dart:convert';

import 'package:reviser/features/common/core/utils/database.dart';
import 'package:reviser/features/vocabulary/data/models/word/vocabulary_word_model.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/vocabulary_sqlite_database.dart';

extension SQLiteDTOToVocabularyWordModelConverter on Word {
  VocabularyWordModel toModel() => VocabularyWordModel(
        id: id,
        word: word,
        additionDate: additionDate,
      );
}

extension WordModelToSQLiteDTOVocabularyConverter on VocabularyWordModel {
  WordsCompanion toSQLiteDTO({bool insert = true}) {
    return WordsCompanion.insert(
      word: word,
      additionDate: getValueOrAbsent(additionDate),
    );
  }
}
