// All entities are here 'cause
// Right now it doens't requires decoupling at all

import 'package:equatable/equatable.dart';
import 'package:reviser/features/common/core/part_of_speech.dart';

class VocabularyWordEntity extends Equatable {
  const VocabularyWordEntity({
    this.id,
    required this.word,
    required this.definitions,
    this.additionDate,
  });

  final int? id;
  final String word;
  final DateTime? additionDate;
  final List<VocabularyDefinitionEntity> definitions;

  @override
  List<Object> get props => [
        word,
        definitions,
      ];
}

class VocabularyDefinitionEntity extends Equatable {
  const VocabularyDefinitionEntity({
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
