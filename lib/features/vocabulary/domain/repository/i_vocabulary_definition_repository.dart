import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';

abstract interface class IVocabularyDefinitionRepository {

  Future<VocabularyDefinitionEntity> upsert(VocabularyDefinitionEntity definition);

  Future<void> delete(int id);

  Future<void> deleteAllDefinitionsByWordId(int id);

  Future<List<VocabularyDefinitionEntity>> getAllDefinitionsByWordId(int id);
}
