import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';

abstract interface class IVocabularyWordRepository {
  Future<void> insert(VocabularyWordEntity word);

  Future<void> delete(int id);

  Future<List<VocabularyWordEntity>> getAllWords();
}
