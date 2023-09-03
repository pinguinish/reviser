import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviser/features/initialization/models/dependencies.dart';
import 'package:reviser/features/vocabulary/bloc/vocabulary_bloc.dart';
import 'package:reviser/features/vocabulary/domain/interactor/vocabulary_interactor.dart';
import 'package:reviser/features/vocabulary/domain/usecase/save_all_selected_definitions_use_case.dart';

class VocabularyScope extends StatefulWidget {
  const VocabularyScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<VocabularyScope> createState() => _VocabularyScopState();
}

class _VocabularyScopState extends State<VocabularyScope> {
  late final VocabularyBloc bloc;

  @override
  void initState() {
    super.initState();

    final word = Dependencies.of(context).vocabularyWordRepository;
    final definition = Dependencies.of(context).vocabularyDefinitionRepository;

    bloc = VocabularyBloc(
      interactor: VocabularyInteractor(
        saveWordUseCase: SaveWordUseCase(word, definition),
      ),
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
        child: _InheritedVocabulary(child: widget.child),
      );
}

class _InheritedVocabulary extends InheritedWidget {
  const _InheritedVocabulary({
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
