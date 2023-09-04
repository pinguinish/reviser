import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';
import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_definition_repository.dart';
import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_word_repository.dart';

typedef FullVocabularyItem = (
  VocabularyWordEntity word,
  List<VocabularyDefinitionEntity> definitions,
);

final class GetAllWordsUseCase {
  const GetAllWordsUseCase(
    this._wordRepository,
    this._definitionRepository,
  );

  final IVocabularyWordRepository _wordRepository;
  final IVocabularyDefinitionRepository _definitionRepository;

  Future<List<FullVocabularyItem>> call() async {
    final words = await _wordRepository.getAllWords();
    final List<FullVocabularyItem> data = [];
    await Future.forEach(words, (w) async {
      final definitions =
          await _definitionRepository.getAllDefinitionsByWordId(w.id!);
      data.add((w, definitions));
    });
    return data;
  }
}
