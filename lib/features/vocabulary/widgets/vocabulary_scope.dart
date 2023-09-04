import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/core/utils/mixins/scope_mixin.dart';
import 'package:reviser/features/initialization/models/dependencies.dart';
import 'package:reviser/features/vocabulary/bloc/vocabulary_bloc.dart';
import 'package:reviser/features/vocabulary/bloc/vocabulary_event.dart';
import 'package:reviser/features/vocabulary/domain/entities/vocabulary_entities.dart';
import 'package:reviser/features/vocabulary/domain/usecase/get_all_words_use_case.dart';
import 'package:reviser/features/vocabulary/domain/usecase/save_all_selected_definitions_use_case.dart';

class VocabularyScope extends StatefulWidget {
  const VocabularyScope({
    super.key,
    required this.child,
  });

  final Widget child;

  static _VocabularyScopeState _of(BuildContext context) =>
      ScopeMixin.scopeOf<_InheritedVocabulary>(context).state;

  static void saveWords(
    VocabularyWordEntity data,
    List<VocabularyDefinitionEntity> definitions,
    BuildContext context,
  ) =>
      _of(context).bloc.add(VocabularyWordAdded(
            word: data,
            definitions: definitions,
          ));

  static void retrieveAllWords(BuildContext context) =>
      _of(context).bloc.add(VocabularyWordsRetrieved());

  @override
  State<VocabularyScope> createState() => _VocabularyScopeState();
}

class _VocabularyScopeState extends State<VocabularyScope> {
  late final VocabularyBloc bloc;

  @override
  void initState() {
    super.initState();

    final word = Dependencies.of(context).vocabularyWordRepository;
    final definition = Dependencies.of(context).vocabularyDefinitionRepository;

    bloc = VocabularyBloc(
      saveWordUseCase: SaveWordUseCase(word, definition),
      getAllWordsUseCase: GetAllWordsUseCase(word, definition),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: _InheritedVocabulary(
          state: this,
          child: widget.child,
        ),
      );
}

class _InheritedVocabulary extends InheritedWidget {
  final _VocabularyScopeState state;

  const _InheritedVocabulary({
    required super.child,
    required this.state,
  });

  @override
  bool updateShouldNotify(_InheritedVocabulary oldWidget) =>
      state != oldWidget.state;
}
