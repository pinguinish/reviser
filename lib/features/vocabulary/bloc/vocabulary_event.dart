import 'package:equatable/equatable.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';

sealed class VocabularyEvent extends Equatable {}

final class VocabularyWordAdded extends VocabularyEvent {
  VocabularyWordAdded({
    required this.word,
    required this.definitions,
  });

  final VocabularyWordEntity word;
  final List<VocabularyDefinitionEntity> definitions;

  @override
  List<Object> get props => [word];
}

final class VocabularyWordsRetrieved extends VocabularyEvent {
  @override
  List<Object> get props => [];
}
