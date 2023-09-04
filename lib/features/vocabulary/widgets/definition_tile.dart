import 'package:flutter/material.dart';
import 'package:reviser/core/bloc/constant/dimension.dart';
import 'package:reviser/core/bloc/constant/palette.dart';
import 'package:reviser/core/widgets/gaps.dart';

import 'definition_list.dart';

class DefinitionTile extends StatelessWidget {
  const DefinitionTile({
    super.key,
    required this.data,
    required this.isSelected,
  });

  final Definition data;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final example = data.definition.example;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Palette.indigo : Palette.white,
        borderRadius: BorderRadius.circular(Dimension.defaultRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimension.cardPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              text: TextSpan(
                style: TextStyle(
                  color: isSelected ? Palette.white : Palette.black,
                ),
                children: [
                  TextSpan(
                    text: "[${data.partOfSpeech.name}] ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Palette.white : Palette.black,
                    ),
                  ),
                  TextSpan(
                    text: data.definition.definition,
                    style: TextStyle(
                      color: isSelected ? Palette.white : Palette.black,
                    ),
                  ),
                ],
              ),
            ),
            if (example.isNotEmpty) ...[
              smallVerticalGap,
              Text(
                data.definition.example,
                style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? Palette.white : Palette.grey,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
