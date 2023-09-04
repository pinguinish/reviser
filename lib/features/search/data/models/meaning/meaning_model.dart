import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reviser/features/common/core/part_of_speech.dart';

import '../definition/definition_model.dart';

part 'meaning_model.g.dart';

@JsonSerializable()
class MeaningModel extends Equatable {
  const MeaningModel({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  final PartOfSpeech partOfSpeech;
  final List<DefinitionModel> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  factory MeaningModel.fromJson(Map<String, dynamic> json) =>
      _$MeaningModelFromJson(json);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [partOfSpeech, definitions, synonyms, antonyms];
}


