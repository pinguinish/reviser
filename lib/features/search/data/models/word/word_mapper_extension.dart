import 'package:reviser/features/search/data/models/meaning/meaning_mapper_extension.dart';
import 'package:reviser/features/search/data/models/word/word_model.dart';
import 'package:reviser/features/common/domain/entities/word_entity.dart';

extension WordDataMapper on WordModel {
  WordEntity toEntity() {
    return WordEntity(
      word: word,
      phonetic: phonetic ?? "",
      meanings: meanings.map((e) => e.toEntity()).toList(),
    );
  }
}
