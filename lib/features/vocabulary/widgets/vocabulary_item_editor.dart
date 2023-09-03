import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reviser/core/constant/dimension.dart';
import 'package:reviser/core/constant/palette.dart';
import 'package:reviser/core/constant/strings.dart';
import 'package:reviser/core/utils/mixins/validator_mixin.dart';
import 'package:reviser/core/widgets/gaps.dart';
import 'package:reviser/core/widgets/snack_bar_manager.dart';
import 'package:reviser/core/widgets/tag.dart';
import 'package:reviser/features/common/domain/entities/word_entity.dart';
import 'package:reviser/features/search/widgets/search_scope.dart';
import '../../../core/widgets/default_text_button.dart';
import '_temp_/definition_list.dart';

// [TODO]: Make this widget be able to work with adding new words
@RoutePage(name: "VocabularyItemEditorRoute")
class VocabularyItemEditor extends StatefulWidget {
  const VocabularyItemEditor({
    super.key,
    required this.definition,
  });

  final Definition definition;

  @override
  State<VocabularyItemEditor> createState() => _VocabularyItemEditorState();
}

class _VocabularyItemEditorState extends State<VocabularyItemEditor>
    with ValidatorMixin {
  late final _wordTextController = TextEditingController();

  late final _definitionTextController = TextEditingController();

  late final _exampleTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final words = SearchScope.wordsMaybeOf(context, listen: false) ?? [];
    _wordTextController.text = words.first.word;
    _definitionTextController.text = widget.definition.definition.definition;
    final example = widget.definition.definition.example;
    if (example.isNotEmpty) _exampleTextController.text = example;
  }

  @override
  void dispose() {
    _wordTextController.dispose();
    _definitionTextController.dispose();
    _exampleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimension.contentSidePadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: Theme.of(context).textTheme.displayLarge,
                controller: _wordTextController,
                maxLines: 1,
              ),
              defaultVerticalGap,
              Tag(
                tag: widget.definition.partOfSpeech.name,
                color: Palette.grey,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: Strings.hintDefinition,
                ),
                controller: _definitionTextController,
                minLines: 1,
                maxLines: 5,
              ),
              defaultVerticalGap,
              TextField(
                decoration: const InputDecoration(
                  hintText: Strings.hintExample,
                ),
                minLines: 1,
                controller: _exampleTextController,
                maxLines: 3,
              ),
              defaultVerticalGap,
              SizedBox(
                width: double.infinity,
                child: DefaultTextButton(
                  onPressed: edit,
                  text: Strings.submit,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(backgroundColor: Palette.white),
    );
  }

  void edit() {
    if (isEmpty(_definitionTextController.text)) {
      return SnackBarManager.info(
        context: context,
        info: ErrorStrings.definitionCannotBeEmpty,
      );
    }
    _comeBackReturningDefinition();
  }

  Future<bool> _comeBackReturningDefinition() {
    return context.router.pop<Definition>(
      (
        definition: DefinitionEntity(
          definition: _definitionTextController.text.replaceAll("\n", ' '),
          example: _exampleTextController.text.replaceAll("\n", ' '),
        ),
        partOfSpeech: widget.definition.partOfSpeech,
      ),
    );
  }
}
