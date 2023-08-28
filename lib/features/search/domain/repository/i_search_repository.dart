import 'package:reviser/features/search/domain/entities/word_entity.dart';

abstract interface class ISearchRepository {
  Future<List<WordEntity>> search(String word);
}
