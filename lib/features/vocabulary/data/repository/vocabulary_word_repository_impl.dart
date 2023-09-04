import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/features/vocabulary/data/models/word/vocabulary_word_mapper.dart';
import 'package:reviser/features/vocabulary/data/sources/local/i_vocabulary_word_local_data_source.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';
import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_word_repository.dart';

final class VocabularyWordRepositoryImpl implements IVocabularyWordRepository {
  const VocabularyWordRepositoryImpl({
    required IVocabularyWordLocalDataSource local,
  }) : _local = local;

  final IVocabularyWordLocalDataSource _local;

  @override
  Future<void> delete(int id) async {
    try {
      _local.deleteWordById(id);
    } on Object {
      rethrow;
    }
  }

  @override
  Future<List<VocabularyWordEntity>> getAllWords() async {
    try {
      final models = await _local.getAllWords();
      return models.map((m) => m.toEntity()).toList();
    } on Object {
      rethrow;
    }
  }

  @override
  Future<VocabularyWordEntity> insert(VocabularyWordEntity word) async {
    try {
      final model = word.toModel();
      final dto = await _local.insertWord(model.copyWith(
        additionDate: DateTime.now(),
      ));
      return dto.toEntity();
    } on Object {
      rethrow;
    }
  }
}
