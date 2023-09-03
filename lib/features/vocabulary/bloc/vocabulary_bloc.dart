import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:reviser/features/vocabulary/bloc/vocabulary_event.dart';
import 'package:reviser/features/vocabulary/bloc/vocabulary_state.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';
import 'package:reviser/features/vocabulary/domain/interactor/vocabulary_interactor.dart';
import 'package:reviser/features/vocabulary/domain/usecase/save_all_selected_definitions_use_case.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  final VocabularyInteractor interactor;

  VocabularyBloc({
    required this.interactor,
  }) : super(VocabularyIdle()) {
    on<VocabularyEvent>(
      (event, emit) => switch (event) {
        VocabularyWordAdded(word: final words) =>
          _handleWordsAdditionEvent(words, emit),
      },
      transformer: sequential(),
    );
  }

  void _handleWordsAdditionEvent(
    VocabularyWordEntity word,
    Emitter<VocabularyState> emit,
  ) {
    try {
      interactor.saveWord(word);
    } on Object {
      rethrow;
    }
  }
}
