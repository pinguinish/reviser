import 'package:reviser/features/search/domain/entities/word_entity.dart';

sealed class SearchState {
  final List<WordEntity> words;
  const SearchState({this.words = const []});
}

class SearchIdle extends SearchState {
  SearchIdle();
}

class SearchProsessing extends SearchState {
  const SearchProsessing({super.words});
}

class SearchSuccess extends SearchState {
  const SearchSuccess({required super.words});
}

class SearchError extends SearchState {
  final bool isNotFound;

  const SearchError({this.isNotFound = false});
}
