import 'package:reviser/features/common/core/utils/database.dart';
import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_model.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/vocabulary_sqlite_database.dart';

extension SQLiteDTOToVocabularyDefinitionModelConverter on Definition {
  VocabularyDefinitionModel toModel() => VocabularyDefinitionModel(
        id: id,
        wordId: wordId,
        definition: definition,
        partOfSpeech: partOfSpeech,
        lastRepetition: lastRepetition,
        repetitionLeftCount: repetitionLeftCount,
        example: example,
      );
}

extension SQLiteWordModelToDTOVocabularyConverter on VocabularyDefinitionModel {
  DefinitionsCompanion toSQLiteDTO({bool insert = true}) {
    return DefinitionsCompanion.insert(
      wordId: getValueOrAbsent(wordId),
      definition: definition,
      partOfSpeech: partOfSpeech,
      lastRepetition: getValueOrAbsent(lastRepetition),
      example: example,
    );
  }
}

