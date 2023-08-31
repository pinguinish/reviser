import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviser/core/constant/palette.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/features/search/bloc/search_bloc.dart';

import '../../bloc/search_state.dart';
import '../search.dart';
import '../search_scope.dart';
import 'definition_list.dart';

@RoutePage()
class RepositoryScreen extends StatelessWidget {
  const RepositoryScreen({
    @PathParam('search') this.search,
    super.key,
  });

  final String? search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 100 - kToolbarHeight),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Search(previous: search == null ? "" : search!),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: BlocBuilder<SearchBloc, SearchState>(
                bloc: SearchScope.blocOf(context),
                builder: (_, state) => switch (state) {
                  SearchIdle() => const SizedBox.shrink(),
                  SearchProsessing() => const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  SearchSuccess _ => const _RepositorySuccess(),
                  SearchError _ => _RepositoryError(errorState: state),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
///==========[_RepositorySuccess]==========
//
class _RepositorySuccess extends StatelessWidget {
  const _RepositorySuccess();

  @override
  Widget build(BuildContext context) {
    final definitions = SearchScope.wordsOf(context, listen: false)
        .expand((word) => word.meanings)
        .expand(
          (meaning) => meaning.definitions.map(
            (definition) => (
              partOfSpeech: meaning.partOfSpeech,
              definition: definition,
            ),
          ),
        );

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            "Result: ${definitions.length} definitions",
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        DefinitionList(
          definitions: definitions.toList(),
        ),
      ],
    );
  }
}

//
///==========[_RepositoryError]==========
//

class _RepositoryError extends StatelessWidget {
  const _RepositoryError({
    required this.errorState,
  });

  final SearchError errorState;

  @override
  Widget build(BuildContext context) {
    return _handleConnectionError() ??
        switch (errorState.isNotFound) {
          true => SliverToBoxAdapter(
                child: Column(
              children: [
                const Text("The word wasn't found"),
                TextButton(
                  style: const ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {
                    logger.d("User wants to add its own definition");
                  },
                  child: const Text(
                    "Add own definition",
                    style: TextStyle(
                      color: Palette.indigo,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )),
          false => const SliverToBoxAdapter(
              child: Center(),
            ),
        };
  }

  SliverToBoxAdapter? _handleConnectionError() {
    if (errorState is! SearchNetworkError) return null;
    final network = (errorState as SearchNetworkError);
    if (network.badConnection == true) {
      return const SliverToBoxAdapter(child: Text("Bad connection"));
    }
    if (network.noInternetConnection == true) {
      return const SliverToBoxAdapter(child: Text("No connection"));
    }
    return null;
  }
}
