import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reviser/core/router/router.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/features/common/core/list_item.dart';
import 'package:reviser/features/common/core/part_of_speech.dart';
import 'package:reviser/features/vocabulary/widgets/definition_tile.dart';
import '../../common/domain/entities/word_entity.dart';

typedef Definition = ({
  DefinitionEntity definition,
  PartOfSpeech partOfSpeech,
});

class DefinitionList extends StatefulWidget {
  const DefinitionList({
    super.key,
    required this.definitions,
    required this.onChanged,
  });

  final List<Definition> definitions;
  final Function(List<Definition>) onChanged;

  @override
  State<DefinitionList> createState() => _DefinitionListState();
}

class _DefinitionListState extends State<DefinitionList> {
  final List<Definition> selectedDefinitions = [];
  final List<ListItem<Definition>> selectableDefinitions = [];

  @override
  void initState() {
    super.initState();
    final selectableItems = widget.definitions.map(
      (d) => ListItem<Definition>(d),
    );
    selectableDefinitions.addAll(selectableItems);
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: widget.definitions.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => select(index),
          onLongPress: () => edit(index),
          child: DefinitionTile(
            data: selectableDefinitions[index].data,
            isSelected: selectableDefinitions[index].isSelected,
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  // Used to select a prticular item of the [selectableDefinitions]
  // then notify using [onChanged]
  void select(int index) {
    final isSelected = selectableDefinitions[index].isSelected;
    selectableDefinitions[index].isSelected = !isSelected;

    if (selectableDefinitions[index].isSelected) {
      selectedDefinitions.add(selectableDefinitions[index].data);
    } else {
      selectedDefinitions.remove(selectableDefinitions[index].data);
    }
    setState(() {});

    widget.onChanged(selectedDefinitions);
  }

  // Used to edit items
  //
  // First of all it navigates to [VocabularyItemEditor]
  // Then if an user edit the data of an item, it updates
  // Otherwise it does nothing
  Future<void> edit(int index) async {
    final data = await _navigateToVocabularyItemEditor(context, index);

    if (data == null) return;

    final selectableItem = selectableDefinitions[index].data;

    if (selectedDefinitions.contains(selectableItem)) {
      final selectedItemIndex = selectedDefinitions.indexWhere(
        (element) => element == selectableDefinitions[index].data,
      );
      selectedDefinitions[selectedItemIndex] = data;
    }

    setState(() {
      selectableDefinitions[index].data = data;
    });
  }

  // Used to navigate to [VocabularyItemEditor]
  // Also it returns [Definitions]
  Future<Definition?> _navigateToVocabularyItemEditor(
    BuildContext context,
    int index,
  ) async {
    final data = await context.router.push(
      VocabularyItemEditorRoute(
        definition: selectableDefinitions[index].data,
      ),
    );
    if (data is Definition?) return data;
    logger.f(
      """Caught unexpected behavoiour."""
      """VocabularyItemEditorRoute returns a value whose type is other than nullable-[Definition]""",
    );
    return null;
  }
}
