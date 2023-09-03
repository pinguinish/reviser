import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';

abstract interface class IVocabularyDefinitionRepository {
  Future<void> upsert(VocabularyDefinitionEntity definition);

  Future<void> delete(int id);

  Future<List<VocabularyDefinitionEntity>> getAllDefinitionsByWordId(int id);
}
