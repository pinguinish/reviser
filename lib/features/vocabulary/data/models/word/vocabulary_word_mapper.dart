import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_mapper.dart';
import 'package:reviser/features/vocabulary/data/models/word/vocabulary_word_model.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';

extension VocabularyWordEntityMapper on VocabularyWordEntity {
  VocabularyWordModel toModel() => VocabularyWordModel(
        id: id,
        word: word,
        additionDate: additionDate,
        definitions: definitions.map((d) => d.toModel()).toList(),
      );
}

extension VocabularyWordModelMapper on VocabularyWordModel {
  VocabularyWordEntity toEntity() => VocabularyWordEntity(
        word: word,
        definitions: definitions.map((d) => d.toEntity()).toList(),
        additionDate: additionDate,
      );
}
