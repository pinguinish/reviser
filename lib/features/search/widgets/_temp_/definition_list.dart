import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reviser/core/router/router.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/features/search/widgets/search_scope.dart';
import '../../../../core/constant/palette.dart';
import '../../../common/domain/entities/word_entity.dart';

typedef Definition = ({
  DefinitionEntity definition,
  String partOfSpeech,
});

class DefinitionList extends StatefulWidget {
  const DefinitionList({
    super.key,
    required this.definitions,
  });

  final List<Definition> definitions;

  @override
  State<DefinitionList> createState() => _DefinitionListState();
}

class _DefinitionListState extends State<DefinitionList> {
  @override
  Widget build(BuildContext context) {
    final data = SearchScope.wordsOf(context);
    logger.d("UPDATED");
    return SliverList.separated(
      itemCount: widget.definitions.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress: ()  async {
            widget.definitions[index] = await navigateToVocabularyItemEditor(context, index);
            setState(() {
              
            });
          },
          child: DefinitionTile(
            data: widget.definitions[index],
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  Future<Definition> navigateToVocabularyItemEditor(
    BuildContext context,
    int index,
  ) async {
   final data = await context.router.push(
      VocabularyItemEditorRoute(
        definition: widget.definitions[index],
      ),
    );
   return data! as Definition;
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
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "[${data.partOfSpeech}] ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
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
