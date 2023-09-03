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
    _local.deleteWordById(id);
  }

  @override
  Future<List<VocabularyWordEntity>> getAllWords() async {
    final models = await _local.getAllWords();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> insert(VocabularyWordEntity word) async {
    final model = word.toModel();
    _local.insertWord(model.copyWith(
      additionDate: DateTime.now(),
    ));
  }
}
