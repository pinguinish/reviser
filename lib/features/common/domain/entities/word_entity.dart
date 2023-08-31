// All entities are here 'cause
// Right now it doens't requires decoupling at all

import 'package:equatable/equatable.dart';

class WordEntity extends Equatable {
  final String word;

  final String phonetic;

  final List<MeaningEntity> meanings;

  const WordEntity({
    required this.word,
    required this.phonetic,
    required this.meanings,
  });

  @override
  List<Object> get props => [word, phonetic, meanings];
}

class MeaningEntity extends Equatable {
  final String partOfSpeech;
  final List<DefinitionEntity> definitions;

  const MeaningEntity({
    required this.partOfSpeech,
    required this.definitions,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [partOfSpeech, definitions];
}

class DefinitionEntity extends Equatable {
  const DefinitionEntity({
    required this.definition,
    required this.example,
  });
  final String definition;
  final String example;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [definition, example];
}
