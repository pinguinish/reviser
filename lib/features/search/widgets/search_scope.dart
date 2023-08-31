import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/core/utils/mixins/scope_mixin.dart';
import 'package:reviser/features/initialization/models/dependencies.dart';
import 'package:reviser/features/search/bloc/search_bloc.dart';
import 'package:reviser/features/search/bloc/search_event.dart';
import 'package:reviser/features/search/bloc/search_state.dart';
import 'package:reviser/features/common/domain/entities/word_entity.dart';

typedef SearchCallback = Function(String);

/// SearchScope is propogated to the widget tree and works a
/// s an util to look up searching word in the dictionary
class SearchScope extends StatefulWidget {
  const SearchScope({
    super.key,
    required this.child,
  });

  final Widget child;

  static _SearchScopeState _of(BuildContext context, {final listen = true}) =>
      ScopeMixin.scopeOf<_InheritedSearch>(context, listen: listen).state;

  /// Get SearchBloc which
  /// exposed in the [_SearchScopeState]
  static SearchBloc blocOf(BuildContext context, {final listen = true}) =>
      ScopeMixin.scopeOf<_InheritedSearch>(context, listen: listen).state.bloc;

  /// Get the current searching word(s) which
  /// stored in [_InheritedSearch]
  static List<WordEntity> wordsOf(
    BuildContext context, {
    final listen = true,
  }) =>
      ScopeMixin.scopeOf<_InheritedSearch>(context, listen: listen).words;

  /// Look up a word in the dictionary
  ///
  /// Notify bloc sending the search event incorporating [match]
  /// also perform the next action passed [onSearch]
  static void search({
    required BuildContext context,
    required String match,
    SearchCallback? onSearch,
  }) {
    final scope = _of(context);
    scope.bloc.add(SearchStarted(word: match));
    if (onSearch != null) onSearch(match);
  }

  @override
  State<SearchScope> createState() => _SearchScopeState();
}

class _SearchScopeState extends State<SearchScope> {
  late SearchBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SearchBloc(
      repository: Dependencies.of(context).searchRepository,
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<SearchBloc>.value(
        value: bloc,
        child: BlocBuilder<SearchBloc, SearchState>(builder: (_, state) {
          logger.d(state.words);
          return _InheritedSearch(
            words: state.words,
            state: this,
            child: widget.child,
          );
        }),
      );
}

class _InheritedSearch extends InheritedWidget {
  /// Search's state that provides opportunities 
  /// to manipulate with [SearchBloc] by [InheritedWidget] and the Widget tree
  final _SearchScopeState state;

  /// The current representation of searching word
  final List<WordEntity> words;

  const _InheritedSearch({
    required super.child,
    required this.words,
    required this.state,
  });

  @override
  bool updateShouldNotify(_InheritedSearch old) =>
      !identical(
        words.length,
        old.words.length,
      ) ||
      bothNotEmpty(words, old.words) &&
          !identical(
            words.first.word,
            old.words.first.word,
          );
}

/// Whether both params're not empty
bool bothNotEmpty<T extends Iterable>(T first, T second) =>
    first.isNotEmpty && second.isNotEmpty;
