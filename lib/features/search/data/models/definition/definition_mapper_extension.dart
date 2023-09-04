import 'package:reviser/features/search/data/models/definition/definition_model.dart';
import 'package:reviser/features/common/domain/entities/word_entity.dart';

extension DefinitionDataMapper on DefinitionModel {
  DefinitionEntity toEntity() => DefinitionEntity(
        definition: definition,
        example: example ?? "",
      );
}