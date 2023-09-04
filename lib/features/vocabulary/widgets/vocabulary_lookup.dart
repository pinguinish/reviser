import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                      return _VocabularyItemData(word: words[index]);
                    },
                    separatorBuilder: (_, __) => const Divider(),
                  ),
                // TODO: Handle this case.
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
  const _VocabularyItemData({required this.word});

  final FullVocabularyItem word;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              word.$1.word,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            ...word.$2.map((e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.definition),
                  if (e.example.isNotEmpty) Text(e.example),
                  const SizedBox(
                    height: 30,
                  )
                ],
              );
            }),
          ],
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.highlight_remove_outlined),
          ),
        ),
      ],
    );
  }
}
