// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordModel _$WordModelFromJson(Map<String, dynamic> json) => WordModel(
      word: json['word'] as String,
      phonetics: (json['phonetics'] as List<dynamic>)
          .map((e) => PhoneticModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meanings: (json['meanings'] as List<dynamic>)
          .map((e) => MeaningModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      phonetic: json['phonetic'] as String? ?? '',
    );

Map<String, dynamic> _$WordModelToJson(WordModel instance) => <String, dynamic>{
      'word': instance.word,
      'phonetic': instance.phonetic,
      'phonetics': instance.phonetics,
      'meanings': instance.meanings,
    };
