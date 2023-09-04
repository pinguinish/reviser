import 'dart:async';

import 'package:reviser/features/vocabulary/data/models/word/vocabulary_word_model.dart';

abstract interface class IVocabularyWordLocalDataSource {
  FutureOr<VocabularyWordModel> insertWord(VocabularyWordModel word);

  FutureOr<void> deleteWordById(int id);

  FutureOr<List<VocabularyWordModel>> getAllWords();
}

