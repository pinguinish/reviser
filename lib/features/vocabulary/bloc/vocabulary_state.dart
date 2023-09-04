import 'package:equatable/equatable.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';

sealed class VocabularyState extends Equatable {
  const VocabularyState();
}

final class VocabularyIdle extends VocabularyState {
  @override
  List<Object> get props => [];
}

final class VocabularyProccessing extends VocabularyState {
  @override
  List<Object> get props => [];
}

final class VocabularySuccess extends VocabularyState {
  const VocabularySuccess({required this.words});

  final List<(VocabularyWordEntity, List<VocabularyDefinitionEntity>)> words;

  @override
  List<Object> get props => [words];
}

final class VocabularyError extends VocabularyState {
  const VocabularyError();
  @override
  List<Object> get props => [];
}
