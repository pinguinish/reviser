import 'package:drift/drift.dart';

class Words extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get word => text()();
  DateTimeColumn get additionDate => dateTime().nullable()();
}
