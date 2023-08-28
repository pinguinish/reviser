import 'package:reviser/features/search/data/models/word/word_model.dart';

abstract interface class ISearchRemoteDataSource {
  Future<List<WordModel>> search(String word);
}
