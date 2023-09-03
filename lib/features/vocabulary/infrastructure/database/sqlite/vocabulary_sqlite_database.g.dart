// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_sqlite_database.dart';

// ignore_for_file: type=lint
class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _additionDateMeta =
      const VerificationMeta('additionDate');
  @override
  late final GeneratedColumn<DateTime> additionDate = GeneratedColumn<DateTime>(
      'addition_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _definitionIdsMeta =
      const VerificationMeta('definitionIds');
  @override
  late final GeneratedColumn<String> definitionIds = GeneratedColumn<String>(
      'definition_ids', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, word, additionDate, definitionIds];
  @override
  String get aliasedName => _alias ?? 'words';
  @override
  String get actualTableName => 'words';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('addition_date')) {
      context.handle(
          _additionDateMeta,
          additionDate.isAcceptableOrUnknown(
              data['addition_date']!, _additionDateMeta));
    } else if (isInserting) {
      context.missing(_additionDateMeta);
    }
    if (data.containsKey('definition_ids')) {
      context.handle(
          _definitionIdsMeta,
          definitionIds.isAcceptableOrUnknown(
              data['definition_ids']!, _definitionIdsMeta));
    } else if (isInserting) {
      context.missing(_definitionIdsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, word};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      additionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}addition_date'])!,
      definitionIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}definition_ids'])!,
    );
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final int id;
  final String word;
  final DateTime additionDate;
  final String definitionIds;
  const Word(
      {required this.id,
      required this.word,
      required this.additionDate,
      required this.definitionIds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['addition_date'] = Variable<DateTime>(additionDate);
    map['definition_ids'] = Variable<String>(definitionIds);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      word: Value(word),
      additionDate: Value(additionDate),
      definitionIds: Value(definitionIds),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      additionDate: serializer.fromJson<DateTime>(json['additionDate']),
      definitionIds: serializer.fromJson<String>(json['definitionIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'additionDate': serializer.toJson<DateTime>(additionDate),
      'definitionIds': serializer.toJson<String>(definitionIds),
    };
  }

  Word copyWith(
          {int? id,
          String? word,
          DateTime? additionDate,
          String? definitionIds}) =>
      Word(
        id: id ?? this.id,
        word: word ?? this.word,
        additionDate: additionDate ?? this.additionDate,
        definitionIds: definitionIds ?? this.definitionIds,
      );
  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('additionDate: $additionDate, ')
          ..write('definitionIds: $definitionIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, additionDate, definitionIds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.word == this.word &&
          other.additionDate == this.additionDate &&
          other.definitionIds == this.definitionIds);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<String> word;
  final Value<DateTime> additionDate;
  final Value<String> definitionIds;
  final Value<int> rowid;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.additionDate = const Value.absent(),
    this.definitionIds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WordsCompanion.insert({
    required int id,
    required String word,
    required DateTime additionDate,
    required String definitionIds,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        word = Value(word),
        additionDate = Value(additionDate),
        definitionIds = Value(definitionIds);
  static Insertable<Word> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<DateTime>? additionDate,
    Expression<String>? definitionIds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (additionDate != null) 'addition_date': additionDate,
      if (definitionIds != null) 'definition_ids': definitionIds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<DateTime>? additionDate,
      Value<String>? definitionIds,
      Value<int>? rowid}) {
    return WordsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      additionDate: additionDate ?? this.additionDate,
      definitionIds: definitionIds ?? this.definitionIds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (additionDate.present) {
      map['addition_date'] = Variable<DateTime>(additionDate.value);
    }
    if (definitionIds.present) {
      map['definition_ids'] = Variable<String>(definitionIds.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('additionDate: $additionDate, ')
          ..write('definitionIds: $definitionIds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DefinitionsTable extends Definitions
    with TableInfo<$DefinitionsTable, Definition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DefinitionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _definitionMeta =
      const VerificationMeta('definition');
  @override
  late final GeneratedColumn<String> definition = GeneratedColumn<String>(
      'definition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _partOfSpeechMeta =
      const VerificationMeta('partOfSpeech');
  @override
  late final GeneratedColumnWithTypeConverter<PartOfSpeech, String>
      partOfSpeech = GeneratedColumn<String>(
              'part_of_speech', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<PartOfSpeech>(
              $DefinitionsTable.$converterpartOfSpeech);
  static const VerificationMeta _repetitionLeftCountMeta =
      const VerificationMeta('repetitionLeftCount');
  @override
  late final GeneratedColumn<int> repetitionLeftCount = GeneratedColumn<int>(
      'repetition_left_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(3));
  static const VerificationMeta _lastRepetitionMeta =
      const VerificationMeta('lastRepetition');
  @override
  late final GeneratedColumn<DateTime> lastRepetition =
      GeneratedColumn<DateTime>('last_repetition', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _examplesMeta =
      const VerificationMeta('examples');
  @override
  late final GeneratedColumn<String> examples = GeneratedColumn<String>(
      'examples', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        definition,
        partOfSpeech,
        repetitionLeftCount,
        lastRepetition,
        examples
      ];
  @override
  String get aliasedName => _alias ?? 'definitions';
  @override
  String get actualTableName => 'definitions';
  @override
  VerificationContext validateIntegrity(Insertable<Definition> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('definition')) {
      context.handle(
          _definitionMeta,
          definition.isAcceptableOrUnknown(
              data['definition']!, _definitionMeta));
    } else if (isInserting) {
      context.missing(_definitionMeta);
    }
    context.handle(_partOfSpeechMeta, const VerificationResult.success());
    if (data.containsKey('repetition_left_count')) {
      context.handle(
          _repetitionLeftCountMeta,
          repetitionLeftCount.isAcceptableOrUnknown(
              data['repetition_left_count']!, _repetitionLeftCountMeta));
    }
    if (data.containsKey('last_repetition')) {
      context.handle(
          _lastRepetitionMeta,
          lastRepetition.isAcceptableOrUnknown(
              data['last_repetition']!, _lastRepetitionMeta));
    } else if (isInserting) {
      context.missing(_lastRepetitionMeta);
    }
    if (data.containsKey('examples')) {
      context.handle(_examplesMeta,
          examples.isAcceptableOrUnknown(data['examples']!, _examplesMeta));
    } else if (isInserting) {
      context.missing(_examplesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Definition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Definition(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      definition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}definition'])!,
      partOfSpeech: $DefinitionsTable.$converterpartOfSpeech.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}part_of_speech'])!),
      repetitionLeftCount: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}repetition_left_count'])!,
      lastRepetition: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_repetition'])!,
      examples: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}examples'])!,
    );
  }

  @override
  $DefinitionsTable createAlias(String alias) {
    return $DefinitionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PartOfSpeech, String, String>
      $converterpartOfSpeech =
      const EnumNameConverter<PartOfSpeech>(PartOfSpeech.values);
}

class Definition extends DataClass implements Insertable<Definition> {
  final int id;
  final String definition;
  final PartOfSpeech partOfSpeech;
  final int repetitionLeftCount;
  final DateTime lastRepetition;
  final String examples;
  const Definition(
      {required this.id,
      required this.definition,
      required this.partOfSpeech,
      required this.repetitionLeftCount,
      required this.lastRepetition,
      required this.examples});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['definition'] = Variable<String>(definition);
    {
      final converter = $DefinitionsTable.$converterpartOfSpeech;
      map['part_of_speech'] = Variable<String>(converter.toSql(partOfSpeech));
    }
    map['repetition_left_count'] = Variable<int>(repetitionLeftCount);
    map['last_repetition'] = Variable<DateTime>(lastRepetition);
    map['examples'] = Variable<String>(examples);
    return map;
  }

  DefinitionsCompanion toCompanion(bool nullToAbsent) {
    return DefinitionsCompanion(
      id: Value(id),
      definition: Value(definition),
      partOfSpeech: Value(partOfSpeech),
      repetitionLeftCount: Value(repetitionLeftCount),
      lastRepetition: Value(lastRepetition),
      examples: Value(examples),
    );
  }

  factory Definition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Definition(
      id: serializer.fromJson<int>(json['id']),
      definition: serializer.fromJson<String>(json['definition']),
      partOfSpeech: $DefinitionsTable.$converterpartOfSpeech
          .fromJson(serializer.fromJson<String>(json['partOfSpeech'])),
      repetitionLeftCount:
          serializer.fromJson<int>(json['repetitionLeftCount']),
      lastRepetition: serializer.fromJson<DateTime>(json['lastRepetition']),
      examples: serializer.fromJson<String>(json['examples']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'definition': serializer.toJson<String>(definition),
      'partOfSpeech': serializer.toJson<String>(
          $DefinitionsTable.$converterpartOfSpeech.toJson(partOfSpeech)),
      'repetitionLeftCount': serializer.toJson<int>(repetitionLeftCount),
      'lastRepetition': serializer.toJson<DateTime>(lastRepetition),
      'examples': serializer.toJson<String>(examples),
    };
  }

  Definition copyWith(
          {int? id,
          String? definition,
          PartOfSpeech? partOfSpeech,
          int? repetitionLeftCount,
          DateTime? lastRepetition,
          String? examples}) =>
      Definition(
        id: id ?? this.id,
        definition: definition ?? this.definition,
        partOfSpeech: partOfSpeech ?? this.partOfSpeech,
        repetitionLeftCount: repetitionLeftCount ?? this.repetitionLeftCount,
        lastRepetition: lastRepetition ?? this.lastRepetition,
        examples: examples ?? this.examples,
      );
  @override
  String toString() {
    return (StringBuffer('Definition(')
          ..write('id: $id, ')
          ..write('definition: $definition, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('repetitionLeftCount: $repetitionLeftCount, ')
          ..write('lastRepetition: $lastRepetition, ')
          ..write('examples: $examples')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, definition, partOfSpeech,
      repetitionLeftCount, lastRepetition, examples);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Definition &&
          other.id == this.id &&
          other.definition == this.definition &&
          other.partOfSpeech == this.partOfSpeech &&
          other.repetitionLeftCount == this.repetitionLeftCount &&
          other.lastRepetition == this.lastRepetition &&
          other.examples == this.examples);
}

class DefinitionsCompanion extends UpdateCompanion<Definition> {
  final Value<int> id;
  final Value<String> definition;
  final Value<PartOfSpeech> partOfSpeech;
  final Value<int> repetitionLeftCount;
  final Value<DateTime> lastRepetition;
  final Value<String> examples;
  const DefinitionsCompanion({
    this.id = const Value.absent(),
    this.definition = const Value.absent(),
    this.partOfSpeech = const Value.absent(),
    this.repetitionLeftCount = const Value.absent(),
    this.lastRepetition = const Value.absent(),
    this.examples = const Value.absent(),
  });
  DefinitionsCompanion.insert({
    this.id = const Value.absent(),
    required String definition,
    required PartOfSpeech partOfSpeech,
    this.repetitionLeftCount = const Value.absent(),
    required DateTime lastRepetition,
    required String examples,
  })  : definition = Value(definition),
        partOfSpeech = Value(partOfSpeech),
        lastRepetition = Value(lastRepetition),
        examples = Value(examples);
  static Insertable<Definition> custom({
    Expression<int>? id,
    Expression<String>? definition,
    Expression<String>? partOfSpeech,
    Expression<int>? repetitionLeftCount,
    Expression<DateTime>? lastRepetition,
    Expression<String>? examples,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (definition != null) 'definition': definition,
      if (partOfSpeech != null) 'part_of_speech': partOfSpeech,
      if (repetitionLeftCount != null)
        'repetition_left_count': repetitionLeftCount,
      if (lastRepetition != null) 'last_repetition': lastRepetition,
      if (examples != null) 'examples': examples,
    });
  }

  DefinitionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? definition,
      Value<PartOfSpeech>? partOfSpeech,
      Value<int>? repetitionLeftCount,
      Value<DateTime>? lastRepetition,
      Value<String>? examples}) {
    return DefinitionsCompanion(
      id: id ?? this.id,
      definition: definition ?? this.definition,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      repetitionLeftCount: repetitionLeftCount ?? this.repetitionLeftCount,
      lastRepetition: lastRepetition ?? this.lastRepetition,
      examples: examples ?? this.examples,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (definition.present) {
      map['definition'] = Variable<String>(definition.value);
    }
    if (partOfSpeech.present) {
      final converter = $DefinitionsTable.$converterpartOfSpeech;
      map['part_of_speech'] =
          Variable<String>(converter.toSql(partOfSpeech.value));
    }
    if (repetitionLeftCount.present) {
      map['repetition_left_count'] = Variable<int>(repetitionLeftCount.value);
    }
    if (lastRepetition.present) {
      map['last_repetition'] = Variable<DateTime>(lastRepetition.value);
    }
    if (examples.present) {
      map['examples'] = Variable<String>(examples.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DefinitionsCompanion(')
          ..write('id: $id, ')
          ..write('definition: $definition, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('repetitionLeftCount: $repetitionLeftCount, ')
          ..write('lastRepetition: $lastRepetition, ')
          ..write('examples: $examples')
          ..write(')'))
        .toString();
  }
}

abstract class _$VocabularySQLiteDatabase extends GeneratedDatabase {
  _$VocabularySQLiteDatabase(QueryExecutor e) : super(e);
  late final $WordsTable words = $WordsTable(this);
  late final $DefinitionsTable definitions = $DefinitionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words, definitions];
}
