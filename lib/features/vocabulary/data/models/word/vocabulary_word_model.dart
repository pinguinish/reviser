import 'package:equatable/equatable.dart';
import 'package:reviser/features/vocabulary/data/models/definition/vocabulary_definition_model.dart';

class VocabularyWordModel extends Equatable {
  const VocabularyWordModel({
    required this.word,
    this.id,
    this.additionDate,
  });

  final int? id;
  final String word;
  final DateTime? additionDate;

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
    );
  }

  @override
  List<Object> get props => [word];
}
