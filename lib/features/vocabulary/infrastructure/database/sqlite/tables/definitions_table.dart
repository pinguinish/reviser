import 'package:drift/drift.dart';
import 'package:reviser/features/common/core/part_of_speech.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/tables/words_table.dart';

class Definitions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get wordId => integer().nullable().references(Words, #id)();
  TextColumn get definition => text()();
  TextColumn get partOfSpeech => textEnum<PartOfSpeech>()();
  IntColumn get repetitionLeftCount => integer().withDefault(
        const Constant(3),
      )();
  DateTimeColumn get lastRepetition => dateTime().nullable()();
  TextColumn get example => text()();
}
