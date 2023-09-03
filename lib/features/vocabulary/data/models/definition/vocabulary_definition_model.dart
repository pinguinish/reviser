import 'package:equatable/equatable.dart';
import 'package:reviser/features/common/core/part_of_speech.dart';

class VocabularyDefinitionModel extends Equatable {
  const VocabularyDefinitionModel({
    this.id,
    required this.definition,
    required this.partOfSpeech,
    this.lastRepetition,
    this.repetitionLeftCount,
    this.example = "",
  });

  final int? id;
  final String definition;
  final PartOfSpeech partOfSpeech;
  final DateTime? lastRepetition;
  final int? repetitionLeftCount;
  final String example;

  @override
  List<Object> get props => [
        definition,
        partOfSpeech,
        example,
      ];
}
