import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_mapper.dart';
import 'package:reviser/features/vocabulary/data/models/word/vocabulary_word_model.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';

extension VocabularyWordEntityMapper on VocabularyWordEntity {
  VocabularyWordModel toModel() => VocabularyWordModel(
        id: id,
        word: word,
        additionDate: additionDate,
      );
}

extension VocabularyWordModelMapper on VocabularyWordModel {
  VocabularyWordEntity toEntity() => VocabularyWordEntity(
        id: id,
        word: word,
        additionDate: additionDate,
      );
}
