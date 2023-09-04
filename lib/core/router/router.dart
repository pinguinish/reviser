import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:reviser/features/app/widgets/home_screen.dart";
import 'package:reviser/features/common/core/part_of_speech.dart';
import "package:reviser/features/common/domain/entities/word_entity.dart";
import 'package:reviser/features/vocabulary/widgets/repository_screen.dart';
import "package:reviser/features/vocabulary/widgets/vocabulary_item_editor.dart";
import "package:reviser/features/vocabulary/widgets/vocabulary_lookup.dart";


part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitialRoute.page, initial: true),
        AutoRoute(page: RepositoryRoute.page),
        AutoRoute(page: VocabularyItemEditorRoute.page),
        AutoRoute(page: VocabularyLookupRoute.page),
      ];
}
