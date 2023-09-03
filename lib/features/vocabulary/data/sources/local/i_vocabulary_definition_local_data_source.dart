import 'dart:async';

import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_model.dart';

abstract interface class IVocabularyDefinitionLocalDataSource
    implements IVocabularyGetterDefinition {
  FutureOr<void> upsertDefinition(VocabularyDefinitionModel definition);

  FutureOr<void> deleteDefinitionById(int id);
}

abstract interface class IVocabularyGetterDefinition {
  Future<List<VocabularyDefinitionModel>> getAllDefinitionsByWordId(int id);
}
