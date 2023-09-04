import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';

abstract interface class IVocabularyWordRepository {
  Future<VocabularyWordEntity> insert(VocabularyWordEntity word);

  Future<void> delete(int id);

  Future<List<VocabularyWordEntity>> getAllWords();
  
}
