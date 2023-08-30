import 'package:flutter/material.dart';
import '../../../../core/constant/palette.dart';
import 'repository_screen.dart';

class DefinitionList extends StatelessWidget {
  const DefinitionList({
    super.key,
    required this.definitions,
  });

  final List<Definition> definitions;

  @override
  Widget build(BuildContext context) {
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
