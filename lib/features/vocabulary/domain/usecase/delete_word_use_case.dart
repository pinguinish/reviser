import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_definition_repository.dart';
import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_word_repository.dart';

// [TODO]: Implement this use case
class DeleteWordUseCase {
  const DeleteWordUseCase(
    this._wordRepository,
    this._definitionRepository,
  );

  final IVocabularyWordRepository _wordRepository;
  final IVocabularyDefinitionRepository _definitionRepository;

  void call() {

  }
}
