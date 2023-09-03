import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_mapper.dart';
import 'package:reviser/features/vocabulary/data/sources/local/i_vocabulary_definition_local_data_source.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';
import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_definition_repository.dart';

class VocabularyDefinitionRepositoryImpl
    implements IVocabularyDefinitionRepository {
  const VocabularyDefinitionRepositoryImpl({
    required IVocabularyDefinitionLocalDataSource local,
  }) : _local = local;

  final IVocabularyDefinitionLocalDataSource _local;

  @override
  Future<void> delete(int id) async {
    _local.deleteDefinitionById(id);
  }

  @override
  Future<List<VocabularyDefinitionEntity>> getAllDefinitionsByWordId(
    int id,
  ) async {
    final definitions = await _local.getAllDefinitionsByWordId(id);
    return definitions.map((d) => d.toEntity()).toList();
  }

  @override
  Future<void> upsert(VocabularyDefinitionEntity definition) async {
    _local.upsertDefinition(definition.toModel());
  }
}
