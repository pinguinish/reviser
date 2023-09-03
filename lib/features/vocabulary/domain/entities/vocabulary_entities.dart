// All entities are here 'cause
// Right now it doens't requires decoupling at all

import 'package:equatable/equatable.dart';
import 'package:reviser/features/common/core/part_of_speech.dart';

class VocabularyWordEntity extends Equatable {
  const VocabularyWordEntity({
    required this.id,
    required this.word,
    required this.additionDate,
    required this.definitions,
  });

  final int id;
  final String word;
  final DateTime additionDate;
  final List<VocabularyDefinitionEntity> definitions;

  @override
  List<Object> get props => [
        id,
        word,
        additionDate,
        definitions,
      ];
}

class VocabularyDefinitionEntity extends Equatable {
  const VocabularyDefinitionEntity({
    required this.id,
    required this.definition,
    required this.partOfSpeech,
    required this.lastRepetition,
    required this.repetitionLeftCount,
    required this.example,
  });

  final int id;
  final String definition;
  final PartOfSpeech partOfSpeech;
  final DateTime lastRepetition;
  final int repetitionLeftCount;
  final String example;

  @override
  List<Object> get props => [
        id,
        definition,
        partOfSpeech,
        lastRepetition,
        repetitionLeftCount,
        example,
      ];
}
