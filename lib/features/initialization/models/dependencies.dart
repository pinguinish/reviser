import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reviser/features/common/router/router.dart';
import 'package:reviser/features/initialization/widgets/dependencies_scope.dart';
import 'package:reviser/features/search/data/repository/search_repository.dart';
import 'package:reviser/features/search/data/sources/remote/free_dictionary_api/search_remote_data_source.dart';
import 'package:reviser/features/search/data/sources/remote/i_search_remote_data_source.dart';
import 'package:reviser/features/search/domain/repository/i_search_repository.dart';
import 'package:reviser/features/vocabulary/data/repository/vocabulary_definition_repository_impl.dart';
import 'package:reviser/features/vocabulary/data/repository/vocabulary_word_repository_impl.dart';
import 'package:reviser/features/vocabulary/data/sources/local/i_vocabulary_definition_local_data_source.dart';
import 'package:reviser/features/vocabulary/data/sources/local/i_vocabulary_word_local_data_source.dart';
import 'package:reviser/features/vocabulary/data/sources/local/sqlite/vocabulary_definition_local_data_source_impl.dart';
import 'package:reviser/features/vocabulary/data/sources/local/sqlite/vocabulary_word_local_data_source.dart';
import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_definition_repository.dart';
import 'package:reviser/features/vocabulary/domain/repository/i_vocabulary_word_repository.dart';
import 'package:reviser/features/vocabulary/infrastructure/database/sqlite/vocabulary_sqlite_database.dart';
import 'package:reviser/features/vocabulary/infrastructure/http/reviser_http_client.dart';

abstract class Dependencies {
  const Dependencies();

  static Dependencies of(BuildContext context) =>
      DependenciesScope.of(context, listen: false);

  // Router
  abstract final AppRouter router;

  // Clients
  abstract final Dio httpClient;
  abstract final VocabularySQLiteDatabase vocabularySQLiteDatabase;

  // Search
  abstract final ISearchRemoteDataSource searchRemoteDataSource;
  abstract final ISearchRepository searchRepository;

  // Definition
  abstract final IVocabularyDefinitionLocalDataSource
      vocabularyDefinitionLocalDataSource;
  abstract final IVocabularyDefinitionRepository vocabularyDefinitionRepository;

  // Word
  abstract final IVocabularyWordLocalDataSource vocabularyWordLocalDataSource;
  abstract final IVocabularyWordRepository vocabularyWordRepository;
}

final class MutableDependencies extends Dependencies {
  MutableDependencies();

  @override
  late final Dio httpClient = ReviserHttpClient.client;

  @override
  late final ISearchRemoteDataSource searchRemoteDataSource =
      FreeDicionaryRemoteDataSource(httpClient);

  @override
  late final ISearchRepository searchRepository =
      SearchRepository(searchRemoteDataSource: searchRemoteDataSource);

  @override
  late final AppRouter router = AppRouter();

  @override
  late final VocabularySQLiteDatabase vocabularySQLiteDatabase =
      VocabularySQLiteDatabase();

  @override
  late final IVocabularyDefinitionLocalDataSource
      vocabularyDefinitionLocalDataSource =
      VocabularyDefinitionLocalDataSourceImpl(vocabularySQLiteDatabase);

  @override
  late final IVocabularyDefinitionRepository vocabularyDefinitionRepository =
      VocabularyDefinitionRepositoryImpl(
          local: vocabularyDefinitionLocalDataSource);

  @override
  late final IVocabularyWordLocalDataSource vocabularyWordLocalDataSource =
      VocabularyWordLocalDataSourceImpl(vocabularySQLiteDatabase);

  @override
  late final IVocabularyWordRepository vocabularyWordRepository =
      VocabularyWordRepositoryImpl(local: vocabularyWordLocalDataSource);
}
