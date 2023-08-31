import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reviser/features/common/domain/entities/word_entity.dart';
import 'package:reviser/features/search/widgets/_temp_/definition_list.dart';

@RoutePage(name: "VocabularyItemEditorRoute")
class VocabularyItemEditor extends StatefulWidget {
  const VocabularyItemEditor({
    super.key,
    required this.definition,
  });

  final Definition? definition;

  @override
  State<VocabularyItemEditor> createState() => _VocabularyItemEditorState();
}

class _VocabularyItemEditorState extends State<VocabularyItemEditor> {
  late final _definitionTextController = TextEditingController(
      text: widget.definition?.definition.definition ?? "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextField(
                  controller: _definitionTextController,
                  maxLines: 5,
                ),
                OutlinedButton(
                  onPressed: () => context.router.pop<Definition>(
                    (
                      definition: DefinitionEntity(
                        definition: _definitionTextController.text,
                        example: widget.definition!.definition.example,
                      ),
                      partOfSpeech: widget.definition!.partOfSpeech,
                    ),
                  ),
                  child: const Text("Submit"),
                )
              ],
            )),
      ),
      appBar: AppBar(),
    );
  }
}
//