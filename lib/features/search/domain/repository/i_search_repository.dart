import 'package:reviser/features/common/domain/entities/word_entity.dart';

abstract interface class ISearchRepository {
  Future<List<WordEntity>> search(String word);
}
