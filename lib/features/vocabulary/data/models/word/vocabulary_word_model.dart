import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_model.dart';

class VocabularyWordModel extends Equatable {
  const VocabularyWordModel({
    required this.word,
    required this.definitions,
    this.id,
    this.additionDate,
  });

  final int? id;
  final String word;
  final DateTime? additionDate;
  final List<VocabularyDefinitionModel> definitions;

  VocabularyWordModel copyWith({
    int? id,
    String? word,
    DateTime? additionDate,
    List<VocabularyDefinitionModel>? definitions,
  }) {
    return VocabularyWordModel(
      id: id ?? this.id,
      word: word ?? this.word,
      additionDate: additionDate ?? this.additionDate,
      definitions: definitions ?? this.definitions,
    );
  }

  @override
  List<Object> get props => [
        word,
        definitions,
      ];
}
