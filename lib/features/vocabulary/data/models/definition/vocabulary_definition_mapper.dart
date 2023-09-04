import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_model.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';

extension VocabularyModelDefinitionMapper on VocabularyDefinitionModel {
  VocabularyDefinitionEntity toEntity() => VocabularyDefinitionEntity(
        id: id,
        wordId: wordId,
        definition: definition,
        partOfSpeech: partOfSpeech,
        lastRepetition: lastRepetition,
        repetitionLeftCount: repetitionLeftCount,
        example: example,
      );
}

extension VocabularyEntityDefinitionMapper on VocabularyDefinitionEntity {
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
