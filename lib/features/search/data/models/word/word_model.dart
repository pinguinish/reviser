import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../meaning/meaning_model.dart';
import '../phonetic/phonetic_model.dart';

part 'word_model.g.dart';

@JsonSerializable()
class WordModel extends Equatable {
  const WordModel({
    required this.word,
    required this.phonetics,
    required this.meanings,
    this.phonetic,
  });

  final String word;
  @JsonKey(defaultValue: "")
  final String? phonetic;
  final List<PhoneticModel> phonetics;
  final List<MeaningModel> meanings;

  factory WordModel.fromJson(Map<String, dynamic> json) =>
      _$WordModelFromJson(json);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [word, phonetic, phonetics, meanings];
  WordModel copyWith({
    String? word,
    ValueGetter<String?>? phonetic,
    List<PhoneticModel>? phonetics,
    List<MeaningModel>? meanings,
  }) {
    return WordModel(
      word: word ?? this.word,
      phonetic: phonetic != null ? phonetic() : this.phonetic,
      phonetics: phonetics ?? this.phonetics,
      meanings: meanings ?? this.meanings,
    );
  }

}
