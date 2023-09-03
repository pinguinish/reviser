


import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';
import 'package:reviser/features/vocabulary/domain/usecase/save_all_selected_definitions_use_case.dart';

class VocabularyInteractor {
  final SaveWordUseCase saveWordUseCase;

  const VocabularyInteractor({required this.saveWordUseCase});


  void saveWord(VocabularyWordEntity word) => saveWordUseCase(word);
  
}