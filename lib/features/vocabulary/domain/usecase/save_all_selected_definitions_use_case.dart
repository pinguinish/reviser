import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';
import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_definition_repository.dart';
import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_word_repository.dart';

final class SaveWordUseCase {
  const SaveWordUseCase(
    this._wordRepository,
    this._definitionRepository,
  );

  final IVocabularyWordRepository _wordRepository;
  final IVocabularyDefinitionRepository _definitionRepository;

  void call(
    VocabularyWordEntity entityWord,
    List<VocabularyDefinitionEntity> entityDefinitions,
  ) async {
    final word = await _wordRepository.insert(entityWord);
    Future.forEach(entityDefinitions, (element) async {
      _definitionRepository.upsert(element.copyWith(wordId: word.id));
    });
  }
}
