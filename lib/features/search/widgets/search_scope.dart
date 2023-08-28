import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviser/core/utils/mixins/scope_mixin.dart';
import 'package:reviser/features/initialization/models/dependencies.dart';
import 'package:reviser/features/search/bloc/search_bloc.dart';
import 'package:reviser/features/search/bloc/search_event.dart';
import 'package:reviser/features/search/widgets/search.dart';

/// SearchScope is used to perform tasks related to searching in dictionary
///
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
  static String searchOf(BuildContext context, {final listen = true}) =>
      ScopeMixin.scopeOf<_InheritedSearch>(context, listen: listen).search;
  static void search(BuildContext context, String match) {
    final scope = _of(context);
    scope.bloc.add(SearchStarted(word: match));
    // if (Navigator.canPop(context)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => _InheritedSearch(
            search: match,
            state: scope,
            child: const DefinitionPage(),
          ),
        ),
      );
    // }
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
        child: _InheritedSearch(
          search: "",
          state: this,
          child: widget.child,
        ),
      );
}

class _InheritedSearch extends InheritedWidget {
  final _SearchScopeState state;
  final String search;

  const _InheritedSearch({
    required super.child,
    required this.search,
    required this.state,
  });

  @override
  bool updateShouldNotify(_InheritedSearch old) => state != old.state;
}
