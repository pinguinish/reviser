import 'package:reviser/features/search/data/models/definition/definition_mapper_extension.dart';
import 'package:reviser/features/search/data/models/meaning/meaning_model.dart';
import 'package:reviser/features/search/domain/entities/word_entity.dart';

extension MeaningDataMapper on MeaningModel {
  MeaningEntity toEntity() => MeaningEntity(
        partOfSpeech: partOfSpeech,
        definitions: definitions.map((e) => e.toEntity()).toList(),
      );
}
