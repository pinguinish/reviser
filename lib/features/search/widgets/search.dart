import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviser/core/constant/palette.dart';
import 'package:reviser/features/search/bloc/search_bloc.dart';
import 'package:reviser/features/search/bloc/search_state.dart';
import 'package:reviser/features/search/domain/entities/word_entity.dart';
import 'package:reviser/features/search/widgets/search_scope.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _searchTextController.text = SearchScope.searchOf(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
          color: Palette.white, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: TextField(
              controller: _searchTextController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () => SearchScope.search(
                context,
                _searchTextController.text,
              ),
              icon: const Icon(
                Icons.search,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

typedef Definition = ({DefinitionEntity definition, String partOfSpeech});

class DefinitionPage extends StatelessWidget {
  const DefinitionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 50)),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(child: Search()),
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
                  SearchSuccess(words: final words) => SliverMainAxisGroup(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Text("Count ${words.length}"),
                        ),
                        DefinitionList(words: words),
                      ],
                    ),
                  SearchError(isNotFound: final isNotFound) => switch (
                        isNotFound) {
                      true => const SliverToBoxAdapter(
                          child: Text("data"),
                        ),
                      false => const SliverToBoxAdapter(
                          child: Text("data"),
                        ),
                    },
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DefinitionList extends StatelessWidget {
  const DefinitionList({
    super.key,
    required this.words,
  });

  final List<WordEntity> words;

  @override
  Widget build(BuildContext context) {
    List<Definition> definitions = words
        .expand((word) => word.meanings)
        .expand(
          (meaning) => meaning.definitions.map(
            (definition) => (
              partOfSpeech: meaning.partOfSpeech,
              definition: definition,
            ),
          ),
        )
        .toList();

    return SliverList.separated(
      itemCount: definitions.length,
      itemBuilder: (context, index) {
        return DefinitionTile(
          data: definitions[index],
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}

class DefinitionTile extends StatelessWidget {
  const DefinitionTile({
    super.key,
    required this.data,
  });

  final Definition data;

  @override
  Widget build(BuildContext context) {
    final example = data.definition.example;
    return Container(
      color: Palette.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "[${data.partOfSpeech}] ",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: data.definition.definition),
                ],
              ),
            ),
            if (example.isNotEmpty)
              Text(
                data.definition.example,
                style: const TextStyle(fontSize: 10),
              ),
          ],
        ),
      ),
    );
  }
}
