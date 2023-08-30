import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/core/utils/mixins/scope_mixin.dart';
import 'package:reviser/features/initialization/models/dependencies.dart';
import 'package:reviser/features/search/bloc/search_bloc.dart';
import 'package:reviser/features/search/bloc/search_event.dart';
import 'package:reviser/features/search/bloc/search_state.dart';
import 'package:reviser/features/search/domain/entities/word_entity.dart';

typedef SearchCallback = Function(String);

class SearchScope extends StatefulWidget {
  const SearchScope({
    super.key,
    required this.child,
  });

  final Widget child;

  static _SearchScopeState _of(BuildContext context, {final listen = true}) =>
      ScopeMixin.scopeOf<_InheritedSearch>(context, listen: listen).state;

  static SearchBloc blocOf(BuildContext context, {final listen = true}) =>
      ScopeMixin.scopeOf<_InheritedSearch>(context, listen: listen).state.bloc;

  static List<WordEntity> wordsOf(
    BuildContext context, {
    final listen = true,
  }) =>
      ScopeMixin.scopeOf<_InheritedSearch>(context, listen: listen).words;

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
  final _SearchScopeState state;

  final List<WordEntity> words;

  const _InheritedSearch({
    required super.child,
    required this.words,
    required this.state,
  });

  @override
  bool updateShouldNotify(_InheritedSearch old) =>
      !identical(words.length, old.words.length) ||
      words.isNotEmpty &&
          old.words.isNotEmpty &&
          !identical(words.first.word, old.words.first.word);
}
