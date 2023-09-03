import 'package:equatable/equatable.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';

sealed class VocabularyEvent extends Equatable {}

final class VocabularyWordAdded extends VocabularyEvent {
  VocabularyWordAdded({required this.word});

  final VocabularyWordEntity word;

  @override
  List<Object> get props => [word];
}
