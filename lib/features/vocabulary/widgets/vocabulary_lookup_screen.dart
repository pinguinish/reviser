import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviser/core/bloc/constant/dimension.dart';
import 'package:reviser/core/bloc/constant/palette.dart';
import 'package:reviser/core/widgets/gaps.dart';
import 'package:reviser/features/vocabulary/bloc/vocabulary_bloc.dart';
import 'package:reviser/features/vocabulary/bloc/vocabulary_state.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';
import 'package:reviser/features/vocabulary/domain/usecase/get_all_words_use_case.dart';
import 'package:reviser/features/vocabulary/widgets/vocabulary_scope.dart';

@RoutePage(name: "VocabularyLookupRoute")
class VocabularyLookup extends StatelessWidget {
  const VocabularyLookup({super.key});

  @override
  Widget build(BuildContext context) {
    VocabularyScope.retrieveAllWords(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            BlocBuilder<VocabularyBloc, VocabularyState>(
              builder: (_, state) => switch (state) {
                VocabularyIdle() =>
                  const SliverToBoxAdapter(child: SizedBox.shrink()),
                VocabularyProccessing _ => const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                VocabularySuccess(words: final words) => SliverList.separated(
                    itemCount: words.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimension.contentSidePadding,
                        ),
                        child: _VocabularyItemData(item: words[index]),
                      );
                    },
                    separatorBuilder: (_, __) => const Divider(),
                  ),
                VocabularyError() => const SliverToBoxAdapter(
                    child: Text("Error has occured"),
                  ),
              },
            )
          ],
        ),
      ),
      appBar: AppBar(),
    );
  }
}

class _VocabularyItemData extends StatelessWidget {
  const _VocabularyItemData({required this.item});

  final FullVocabularyItem item;

  @override
  Widget build(BuildContext context) {
    final (wordData, definitionsData) = item;
    return Container(
      color: Palette.white,
      padding: const EdgeInsets.all(Dimension.cardPadding),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wordData.word,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              ...definitionsData.asMap().entries.map(
                    (definitionMap) => _DefinitionDataItem(
                      index: definitionMap.key + 1,
                      definition: definitionMap.value,
                    ),
                  ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              color: Palette.indigo,
              onPressed: () {},
              icon: const Icon(Icons.highlight_remove_outlined),
            ),
          ),
        ],
      ),
    );
  }
}

class _DefinitionDataItem extends StatelessWidget {
  const _DefinitionDataItem({
    required this.index,
    required this.definition,
  });

  final int index;
  final VocabularyDefinitionEntity definition;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$index. ${definition.definition}"),
        if (definition.example.isNotEmpty) ...[
          smallVerticalGap,
          Text(
            definition.example,
            style: const TextStyle(
              fontSize: 10,
              color: Palette.grey,
            ),
          ),
        ],
        defaultVerticalGap,
      ],
    );
  }
}
