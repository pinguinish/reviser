

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage(name: "VocabularyItemEditorRoute")
class VocabularyItemEditor extends StatefulWidget {
  const VocabularyItemEditor({super.key});

  @override
  State<VocabularyItemEditor> createState() => _WordEditorScreenState();
}

class _WordEditorScreenState extends State<VocabularyItemEditor> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}