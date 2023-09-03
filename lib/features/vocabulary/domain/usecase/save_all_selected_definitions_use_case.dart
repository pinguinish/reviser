import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';
import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_definition_repository.dart';
import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_word_repository.dart';

class SaveWordUseCase {
  const SaveWordUseCase(
    this._wordRepository,
    this._definitionRepository,
  );

  final IVocabularyWordRepository _wordRepository;
  final IVocabularyDefinitionRepository _definitionRepository;

  void call(VocabularyWordEntity word) {
    _wordRepository.insert(word);
  }
}
