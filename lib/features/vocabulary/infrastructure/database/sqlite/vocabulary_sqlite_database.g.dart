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
      requiredDuringInsert: false,
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
      'addition_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, word, additionDate];
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
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      additionDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}addition_date']),
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
  final DateTime? additionDate;
  const Word({required this.id, required this.word, this.additionDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    if (!nullToAbsent || additionDate != null) {
      map['addition_date'] = Variable<DateTime>(additionDate);
    }
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      word: Value(word),
      additionDate: additionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(additionDate),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      additionDate: serializer.fromJson<DateTime?>(json['additionDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'additionDate': serializer.toJson<DateTime?>(additionDate),
    };
  }

  Word copyWith(
          {int? id,
          String? word,
          Value<DateTime?> additionDate = const Value.absent()}) =>
      Word(
        id: id ?? this.id,
        word: word ?? this.word,
        additionDate:
            additionDate.present ? additionDate.value : this.additionDate,
      );
  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('additionDate: $additionDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, additionDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.word == this.word &&
          other.additionDate == this.additionDate);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<String> word;
  final Value<DateTime?> additionDate;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.additionDate = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    this.additionDate = const Value.absent(),
  }) : word = Value(word);
  static Insertable<Word> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<DateTime>? additionDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (additionDate != null) 'addition_date': additionDate,
    });
  }

  WordsCompanion copyWith(
      {Value<int>? id, Value<String>? word, Value<DateTime?>? additionDate}) {
    return WordsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      additionDate: additionDate ?? this.additionDate,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('additionDate: $additionDate')
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
  static const VerificationMeta _wordIdMeta = const VerificationMeta('wordId');
  @override
  late final GeneratedColumn<int> wordId = GeneratedColumn<int>(
      'word_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES words (id)'));
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
      GeneratedColumn<DateTime>('last_repetition', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _exampleMeta =
      const VerificationMeta('example');
  @override
  late final GeneratedColumn<String> example = GeneratedColumn<String>(
      'example', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        wordId,
        definition,
        partOfSpeech,
        repetitionLeftCount,
        lastRepetition,
        example
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
    if (data.containsKey('word_id')) {
      context.handle(_wordIdMeta,
          wordId.isAcceptableOrUnknown(data['word_id']!, _wordIdMeta));
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
    }
    if (data.containsKey('example')) {
      context.handle(_exampleMeta,
          example.isAcceptableOrUnknown(data['example']!, _exampleMeta));
    } else if (isInserting) {
      context.missing(_exampleMeta);
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
      wordId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}word_id']),
      definition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}definition'])!,
      partOfSpeech: $DefinitionsTable.$converterpartOfSpeech.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}part_of_speech'])!),
      repetitionLeftCount: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}repetition_left_count'])!,
      lastRepetition: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_repetition']),
      example: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}example'])!,
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
  final int? wordId;
  final String definition;
  final PartOfSpeech partOfSpeech;
  final int repetitionLeftCount;
  final DateTime? lastRepetition;
  final String example;
  const Definition(
      {required this.id,
      this.wordId,
      required this.definition,
      required this.partOfSpeech,
      required this.repetitionLeftCount,
      this.lastRepetition,
      required this.example});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || wordId != null) {
      map['word_id'] = Variable<int>(wordId);
    }
    map['definition'] = Variable<String>(definition);
    {
      final converter = $DefinitionsTable.$converterpartOfSpeech;
      map['part_of_speech'] = Variable<String>(converter.toSql(partOfSpeech));
    }
    map['repetition_left_count'] = Variable<int>(repetitionLeftCount);
    if (!nullToAbsent || lastRepetition != null) {
      map['last_repetition'] = Variable<DateTime>(lastRepetition);
    }
    map['example'] = Variable<String>(example);
    return map;
  }

  DefinitionsCompanion toCompanion(bool nullToAbsent) {
    return DefinitionsCompanion(
      id: Value(id),
      wordId:
          wordId == null && nullToAbsent ? const Value.absent() : Value(wordId),
      definition: Value(definition),
      partOfSpeech: Value(partOfSpeech),
      repetitionLeftCount: Value(repetitionLeftCount),
      lastRepetition: lastRepetition == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRepetition),
      example: Value(example),
    );
  }

  factory Definition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Definition(
      id: serializer.fromJson<int>(json['id']),
      wordId: serializer.fromJson<int?>(json['wordId']),
      definition: serializer.fromJson<String>(json['definition']),
      partOfSpeech: $DefinitionsTable.$converterpartOfSpeech
          .fromJson(serializer.fromJson<String>(json['partOfSpeech'])),
      repetitionLeftCount:
          serializer.fromJson<int>(json['repetitionLeftCount']),
      lastRepetition: serializer.fromJson<DateTime?>(json['lastRepetition']),
      example: serializer.fromJson<String>(json['example']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'wordId': serializer.toJson<int?>(wordId),
      'definition': serializer.toJson<String>(definition),
      'partOfSpeech': serializer.toJson<String>(
          $DefinitionsTable.$converterpartOfSpeech.toJson(partOfSpeech)),
      'repetitionLeftCount': serializer.toJson<int>(repetitionLeftCount),
      'lastRepetition': serializer.toJson<DateTime?>(lastRepetition),
      'example': serializer.toJson<String>(example),
    };
  }

  Definition copyWith(
          {int? id,
          Value<int?> wordId = const Value.absent(),
          String? definition,
          PartOfSpeech? partOfSpeech,
          int? repetitionLeftCount,
          Value<DateTime?> lastRepetition = const Value.absent(),
          String? example}) =>
      Definition(
        id: id ?? this.id,
        wordId: wordId.present ? wordId.value : this.wordId,
        definition: definition ?? this.definition,
        partOfSpeech: partOfSpeech ?? this.partOfSpeech,
        repetitionLeftCount: repetitionLeftCount ?? this.repetitionLeftCount,
        lastRepetition:
            lastRepetition.present ? lastRepetition.value : this.lastRepetition,
        example: example ?? this.example,
      );
  @override
  String toString() {
    return (StringBuffer('Definition(')
          ..write('id: $id, ')
          ..write('wordId: $wordId, ')
          ..write('definition: $definition, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('repetitionLeftCount: $repetitionLeftCount, ')
          ..write('lastRepetition: $lastRepetition, ')
          ..write('example: $example')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, wordId, definition, partOfSpeech,
      repetitionLeftCount, lastRepetition, example);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Definition &&
          other.id == this.id &&
          other.wordId == this.wordId &&
          other.definition == this.definition &&
          other.partOfSpeech == this.partOfSpeech &&
          other.repetitionLeftCount == this.repetitionLeftCount &&
          other.lastRepetition == this.lastRepetition &&
          other.example == this.example);
}

class DefinitionsCompanion extends UpdateCompanion<Definition> {
  final Value<int> id;
  final Value<int?> wordId;
  final Value<String> definition;
  final Value<PartOfSpeech> partOfSpeech;
  final Value<int> repetitionLeftCount;
  final Value<DateTime?> lastRepetition;
  final Value<String> example;
  const DefinitionsCompanion({
    this.id = const Value.absent(),
    this.wordId = const Value.absent(),
    this.definition = const Value.absent(),
    this.partOfSpeech = const Value.absent(),
    this.repetitionLeftCount = const Value.absent(),
    this.lastRepetition = const Value.absent(),
    this.example = const Value.absent(),
  });
  DefinitionsCompanion.insert({
    this.id = const Value.absent(),
    this.wordId = const Value.absent(),
    required String definition,
    required PartOfSpeech partOfSpeech,
    this.repetitionLeftCount = const Value.absent(),
    this.lastRepetition = const Value.absent(),
    required String example,
  })  : definition = Value(definition),
        partOfSpeech = Value(partOfSpeech),
        example = Value(example);
  static Insertable<Definition> custom({
    Expression<int>? id,
    Expression<int>? wordId,
    Expression<String>? definition,
    Expression<String>? partOfSpeech,
    Expression<int>? repetitionLeftCount,
    Expression<DateTime>? lastRepetition,
    Expression<String>? example,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (wordId != null) 'word_id': wordId,
      if (definition != null) 'definition': definition,
      if (partOfSpeech != null) 'part_of_speech': partOfSpeech,
      if (repetitionLeftCount != null)
        'repetition_left_count': repetitionLeftCount,
      if (lastRepetition != null) 'last_repetition': lastRepetition,
      if (example != null) 'example': example,
    });
  }

  DefinitionsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? wordId,
      Value<String>? definition,
      Value<PartOfSpeech>? partOfSpeech,
      Value<int>? repetitionLeftCount,
      Value<DateTime?>? lastRepetition,
      Value<String>? example}) {
    return DefinitionsCompanion(
      id: id ?? this.id,
      wordId: wordId ?? this.wordId,
      definition: definition ?? this.definition,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      repetitionLeftCount: repetitionLeftCount ?? this.repetitionLeftCount,
      lastRepetition: lastRepetition ?? this.lastRepetition,
      example: example ?? this.example,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (wordId.present) {
      map['word_id'] = Variable<int>(wordId.value);
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
    if (example.present) {
      map['example'] = Variable<String>(example.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DefinitionsCompanion(')
          ..write('id: $id, ')
          ..write('wordId: $wordId, ')
          ..write('definition: $definition, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('repetitionLeftCount: $repetitionLeftCount, ')
          ..write('lastRepetition: $lastRepetition, ')
          ..write('example: $example')
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
