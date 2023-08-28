import 'dart:io';

import 'package:reviser/core/errors/not_found_exception.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/features/search/data/models/word/word_mapper_extension.dart';
import 'package:reviser/features/search/data/source/remote/i_search_remote_data_source.dart';
import 'package:reviser/features/search/domain/entities/word_entity.dart';
import 'package:reviser/features/search/domain/repository/i_search_repository.dart';

final class SearchRepository implements ISearchRepository {
  const SearchRepository({
    required ISearchRemoteDataSource searchRemoteDataSource,
  }) : _searchRemoteDataSource = searchRemoteDataSource;

  final ISearchRemoteDataSource _searchRemoteDataSource;

  @override
  Future<List<WordEntity>> search(String word, {int count = 5}) async {
    try {
      final wordData = await _searchRemoteDataSource.search(word);
      logger.d(wordData);
      return wordData.map((e) => e.toEntity()).toList();
    } on NotFoundWordException catch(e) {
      logger.i(e);
      return [];
    } on Object {
      rethrow;
    }
  }
}