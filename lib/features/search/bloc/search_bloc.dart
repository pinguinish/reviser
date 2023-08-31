import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:reviser/core/errors/network_conntection_exception.dart';
import 'package:reviser/features/search/bloc/search_event.dart';
import 'package:reviser/features/search/bloc/search_state.dart';
import 'package:reviser/features/search/domain/repository/i_search_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchRepository _repository;

  SearchBloc({required ISearchRepository repository})
      : _repository = repository,
        super(const SearchIdle()) {
    on<SearchStarted>(
      (event, emit) => _search(event.word, emit),
      transformer: sequential(),
    );
  }

  Future<void> _search(String match, Emitter<SearchState> emit) async {
    try {
      emit(const SearchProsessing());
      final data = await _repository.search(match);
      if (data.isEmpty) return emit(const SearchError(isNotFound: true));
      emit(SearchSuccess(words: data));
    } on NoInternetConnection {
      emit(SearchError.network(noInternetConnection: true));
    } on BadInternetConnection {
      emit(SearchError.network(badConnection: true));
    } on Object {
      emit(const SearchError());
      rethrow;
    }
  }
}
