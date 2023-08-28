import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'definition_model.g.dart';

@JsonSerializable()
class DefinitionModel extends Equatable {
  final String definition;
  final String? example;
  final List<String> synonyms;
  final List<String> antonyms;

  const DefinitionModel({
    required this.definition,
    this.example,
    required this.synonyms,
    required this.antonyms,
  });

  factory DefinitionModel.fromJson(Map<String, dynamic> json) =>
      _$DefinitionModelFromJson(json);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [definition, synonyms, antonyms, example];
}

