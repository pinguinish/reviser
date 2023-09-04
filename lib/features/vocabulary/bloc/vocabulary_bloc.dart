import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:reviser/features/vocabulary/bloc/vocabulary_event.dart';
import 'package:reviser/features/vocabulary/bloc/vocabulary_state.dart';
import 'package:reviser/features/vocabulary/domain/usecase/get_all_words_use_case.dart';
import 'package:reviser/features/vocabulary/domain/usecase/save_all_selected_definitions_use_case.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  // [WARNING] Don't do this. it's just superfluous and really silly
  // Consider use a common use case and an interactor instead
  // I'm just a bit lazy to implement it...
  final GetAllWordsUseCase getAllWordsUseCase;
  final SaveWordUseCase saveWordUseCase;

  VocabularyBloc({
    required this.getAllWordsUseCase,
    required this.saveWordUseCase,
  }) : super(VocabularyIdle()) {
    on<VocabularyEvent>(
      (event, emit) => switch (event) {
        VocabularyWordAdded _ => _handleWordsAdditionEvent(event, emit),
        VocabularyWordsRetrieved _ => _handleRetrievedWords(emit),
      },
      transformer: sequential(),
    );
  }

  void _handleWordsAdditionEvent(
    VocabularyWordAdded word,
    Emitter<VocabularyState> emit,
  ) {
    try {
      saveWordUseCase(word.word, word.definitions);
    } on Object {
      emit(const VocabularyError());
      rethrow;
    }
  }

  void _handleRetrievedWords(Emitter<VocabularyState> emit) async {
    try {
      final data = await getAllWordsUseCase();
      emit(VocabularySuccess(words: data));
    } on Object {
      emit(const VocabularyError());
      rethrow;
    }
  }
}
