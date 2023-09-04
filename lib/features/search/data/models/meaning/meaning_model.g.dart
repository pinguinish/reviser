// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meaning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeaningModel _$MeaningModelFromJson(Map<String, dynamic> json) => MeaningModel(
      partOfSpeech: $enumDecode(_$PartOfSpeechEnumMap, json['partOfSpeech']),
      definitions: (json['definitions'] as List<dynamic>)
          .map((e) => DefinitionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      synonyms:
          (json['synonyms'] as List<dynamic>).map((e) => e as String).toList(),
      antonyms:
          (json['antonyms'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MeaningModelToJson(MeaningModel instance) =>
    <String, dynamic>{
      'partOfSpeech': _$PartOfSpeechEnumMap[instance.partOfSpeech]!,
      'definitions': instance.definitions,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
    };

const _$PartOfSpeechEnumMap = {
  PartOfSpeech.noun: 'noun',
  PartOfSpeech.adjective: 'adjective',
  PartOfSpeech.adverb: 'adverb',
  PartOfSpeech.verb: 'verb',
  PartOfSpeech.pronoun: 'pronoun',
  PartOfSpeech.conjunction: 'conjunction',
  PartOfSpeech.interjection: 'interjection',
  PartOfSpeech.determiner: 'determiner',
  PartOfSpeech.preposition: 'preposition',
};
