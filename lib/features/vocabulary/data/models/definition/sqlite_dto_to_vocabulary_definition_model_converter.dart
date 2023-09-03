import 'package:drift/drift.dart';
import 'package:reviser/features/common/core/utils/database.dart';
import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_model.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/vocabulary_sqlite_database.dart';

extension SQLiteDTOToVocabularyDefinitionModelConverter on Definition {
  VocabularyDefinitionModel toModel() => VocabularyDefinitionModel(
        id: id,
        definition: definition,
        partOfSpeech: partOfSpeech,
        lastRepetition: lastRepetition,
        repetitionLeftCount: repetitionLeftCount,
        example: examples,
      );
}

extension SQLiteWordModelToDTOVocabularyConverter on VocabularyDefinitionModel {
  DefinitionsCompanion toSQLiteDTO() => DefinitionsCompanion(
        id: getValueOrAbsent(id),
        definition: Value(definition),
        partOfSpeech: Value(partOfSpeech),
        repetitionLeftCount: getValueOrAbsent(repetitionLeftCount),
        lastRepetition: getValueOrAbsent(lastRepetition),
        examples: Value(example),
      );
}
