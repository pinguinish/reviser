import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
// All entities are here 'cause
// Right now it doens't requires decoupling at all

import 'package:equatable/equatable.dart';
import 'package:reviser/features/common/core/part_of_speech.dart';

class VocabularyWordEntity extends Equatable {
  const VocabularyWordEntity({
    required this.word,
    this.id,
    this.additionDate,
  });

  final int? id;
  final String word;
  final DateTime? additionDate;

  VocabularyWordEntity copyWith({
    int? id,
    String? word,
    DateTime? additionDate,
    List<VocabularyDefinitionEntity>? definitions,
  }) {
    return VocabularyWordEntity(
      id: id ?? this.id,
      word: word ?? this.word,
      additionDate: additionDate ?? this.additionDate,
    );
  }

  @override
  List<Object> get props => [word];
}

class VocabularyDefinitionEntity extends Equatable {
  const VocabularyDefinitionEntity({
    this.wordId,
    required this.definition,
    required this.partOfSpeech,
    required this.example,
    this.id,
    this.lastRepetition,
    this.repetitionLeftCount,
  });

  final int? id;
  final int? wordId;
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
  VocabularyDefinitionEntity copyWith({
    int? id,
    int? wordId,
    String? definition,
    PartOfSpeech? partOfSpeech,
    DateTime? lastRepetition,
    int? repetitionLeftCount,
    String? example,
  }) {
    return VocabularyDefinitionEntity(
      id: id ?? this.id,
      wordId: wordId ?? this.wordId,
      definition: definition ?? this.definition,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      lastRepetition: lastRepetition ?? this.lastRepetition,
      repetitionLeftCount: repetitionLeftCount ?? this.repetitionLeftCount,
      example: example ?? this.example,
    );
  }
}
