import 'dart:async';

import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_model.dart';

abstract interface class IVocabularyDefinitionLocalDataSource {
  Future<VocabularyDefinitionModel> upsertDefinition(
      VocabularyDefinitionModel definition);

  Future<void> deleteDefinitionById(int id);

  Future<void> deleteAllDefinitionsByWordId(int id);

  Future<List<VocabularyDefinitionModel>> getAllDefinitionsByWordId(int id);
}
