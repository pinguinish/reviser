import 'package:equatable/equatable.dart';
import 'package:reviser/features/common/domain/entities/word_entity.dart';

sealed class SearchState extends Equatable {
  final List<WordEntity> words;
  const SearchState({this.words = const []});

  @override
  List<Object> get props => [words];
}

class SearchIdle extends SearchState {
  const SearchIdle();
}

class SearchProsessing extends SearchState {
  const SearchProsessing({super.words});
}

class SearchSuccess extends SearchState {
  const SearchSuccess({required super.words});
}

class SearchError extends SearchState {
  final bool isNotFound;

  const SearchError({
    this.isNotFound = false,
  });

  // factory SearchError.network({
  //   bool noInternetConnection = false,
  //   bool badConnection = false,
  // }) {
  //   return SearchNetworkError(
  //     noInternetConnection: noInternetConnection,
  //     badConnection: badConnection,
  //   );
  // }
}

final class SearchNetworkError extends SearchError {
  const SearchNetworkError();
}

