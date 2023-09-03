import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:reviser/core/errors/not_found_exception.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/features/search/data/models/word/word_model.dart';
import 'package:reviser/features/search/data/source/remote/i_search_remote_data_source.dart';

final class SearchRemoteDataSource implements ISearchRemoteDataSource {
  const SearchRemoteDataSource(this._client);

  final Dio _client;

  /// Used to get word data
  static const kFreeDictionaryApiEndpoint =
      "https://api.dictionaryapi.dev/api/v2/entries/en/";

  /// Search word including multi-words
  ///
  /// [word] is a searched word
  ///
  /// Exmaples:
  /// "hello" -> [WordModel(word: "hello", phonetic:...), ...]
  /// "get rid of" -> [WordModel(word: "get rid of", phonetic:...), ...]
  @override
  Future<List<WordModel>> search(String word) async {
    try {
      if (word.contains(" ")) return await _searchMultipleWord(word);
      return await _getDataWord(word);
    } on Object {
      rethrow;
    }
  }

  /// Gets full phonetic for multiple-words
  ///
  /// To be certain, the server provides
  /// phonetic's string representation only for a single word
  /// Hovewer if a multiple-word is searching, so there is no phonetic string representation
  /// [word] is a searched word
  ///
  /// Example: "get rid of" -> "/ɡet rɪd ɒv/"
  Future<List<WordModel>> _searchMultipleWord(String word) async {
    try {
      final wordx = await _getDataWord(word);
      final futures = word.split(" ").map((part) => _getDataWord(part));
      final words = await Future.wait(futures, eagerError: true);
      String phonetic = words
          .map(
            (w) => w.first.phonetic ?? "",
          )
          .join()
          .replaceAll("//", " ");
      return wordx.map((e) => e.copyWith(phonetic: () => phonetic)).toList();
    } on Object {
      rethrow;
    }
  }

  /// Gets list of word data
  ///
  /// the core method to request
  /// [word] is a searched word
  Future<List<WordModel>> _getDataWord(String word) async {
    try {
      final data = await _client.get("$kFreeDictionaryApiEndpoint$word");

      logger.d("Data: $data");
      return (data.data as List).map((e) => WordModel.fromJson(e)).toList();
    } on DioException catch (e, s) {
      logger.e(
        "Caught error ${e.type}",
        error: e,
        stackTrace: s,
      );
      if (e.response?.statusCode == HttpStatus.notFound) {
        throw NotFoundWordException(word: word);
      }
      rethrow;
    } on Object {
      rethrow;
    }
  }
}
