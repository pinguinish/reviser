import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reviser/core/bloc/constant/dimension.dart';
import 'package:reviser/core/bloc/constant/palette.dart';
import 'package:reviser/core/bloc/constant/strings.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/core/widgets/default_text_button.dart';
import 'package:reviser/core/widgets/gaps.dart';
import 'package:reviser/features/common/domain/entities/word_entity.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';
import 'package:reviser/features/vocabulary/widgets/vocabulary_scope.dart';

import '../../search/bloc/search_state.dart';
import '../../search/widgets/search.dart';
import '../../search/widgets/search_scope.dart';
import 'definition_list.dart';

// [TODO]: it doesn't work with homonyms so fix it later
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
              child: SizedBox(
                height: Dimension.heightAppBar - kToolbarHeight,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimension.contentSidePadding,
              ),
              sliver: SliverMainAxisGroup(
                slivers: [
                  SliverToBoxAdapter(child: Search(previous: search ?? "")),
                  sliverDefaultVerticalGap,
                  SearchScope.result(
                    context: context,
                    processing: (_) => const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (_, error) => _RepositoryError(errorState: error),
                    success: (_, result) => _RepositorySuccess(result: result),
                  ),
                ],
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
class _RepositorySuccess extends StatefulWidget {
  const _RepositorySuccess({
    required this.result,
  });

  final List<WordEntity> result;

  @override
  State<_RepositorySuccess> createState() => _RepositorySuccessState();
}

class _RepositorySuccessState extends State<_RepositorySuccess> {
  List<Definition> definitions = [];

  @override
  void initState() {
    super.initState();
    final words = widget.result.expand((word) => word.meanings).expand(
          (meaning) => meaning.definitions.map(
            (definition) => (
              partOfSpeech: meaning.partOfSpeech,
              definition: definition,
            ),
          ),
        );
    definitions.addAll(words);
  }

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            Strings.resultDefinitionLength(definitions.length),
          ),
        ),
        sliverDefaultVerticalGap,
        DefinitionList(
          definitions: definitions,
          onChanged: (selected) => definitions = selected,
        ),
        sliverDefaultVerticalGap,
        SliverToBoxAdapter(
          child: SizedBox(
            width: double.infinity,
            child: DefaultTextButton(
              onPressed: _save,
              text: Strings.save,
            ),
          ),
        ),
        sliverLargerVerticalGap,
      ],
    );
  }

  void _save() {
    final data = VocabularyWordEntity(
      word: widget.result.first.word,
    );

    final definitionEntities = definitions.map(
      (d) {
        return VocabularyDefinitionEntity(
          definition: d.definition.definition,
          partOfSpeech: d.partOfSpeech,
          example: d.definition.example,
        );
      },
    ).toList();

    VocabularyScope.saveWords(data, definitionEntities, context);
    context.router.pop();
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
    if (errorState is SearchNetworkError) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Text(ErrorStrings.networkConnection),
        ),
      );
    }
    if (errorState.isNotFound) {
      return SliverToBoxAdapter(
        child: Column(
          children: [
            const Text(ErrorStrings.noWordFound),
            TextButton(
              style: const ButtonStyle(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {},
              child: const Text(
                Strings.addDefinition,
                style: TextStyle(
                  color: Palette.indigo,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (errorState.words.isEmpty) {
      logger.f(
        """Caught error in $runtimeType."""
        """None of the allowable conditions have processed. There're no word in the list""",
      );
    }
    logger.e(
      """Caught error in $runtimeType."""
      """None of the allowable conditions have processed. The word is `${errorState.words.first}`""",
    );
    return const SliverToBoxAdapter(child: Text(Strings.somethingWentWrong));
  }
}
