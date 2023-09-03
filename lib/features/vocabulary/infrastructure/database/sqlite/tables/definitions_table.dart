import 'package:drift/drift.dart';
import 'package:reviser/features/common/core/part_of_speech.dart';

class Definitions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get definition => text()();
  TextColumn get partOfSpeech => textEnum<PartOfSpeech>()();
  IntColumn get repetitionLeftCount =>
      integer().withDefault(const Constant(3))();
  DateTimeColumn get lastRepetition => dateTime()();
  TextColumn get examples => text()();
}
