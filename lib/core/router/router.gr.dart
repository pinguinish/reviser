// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    RepositoryRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RepositoryRouteArgs>(
          orElse: () =>
              RepositoryRouteArgs(search: pathParams.optString('search')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RepositoryScreen(
          search: args.search,
          key: args.key,
        ),
      );
    },
    VocabularyItemEditorRoute.name: (routeData) {
      final args = routeData.argsAs<VocabularyItemEditorRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VocabularyItemEditor(
          key: args.key,
          definition: args.definition,
        ),
      );
    },
    VocabularyLookupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VocabularyLookup(),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class InitialRoute extends PageRouteInfo<void> {
  const InitialRoute({List<PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RepositoryScreen]
class RepositoryRoute extends PageRouteInfo<RepositoryRouteArgs> {
  RepositoryRoute({
    String? search,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RepositoryRoute.name,
          args: RepositoryRouteArgs(
            search: search,
            key: key,
          ),
          rawPathParams: {'search': search},
          initialChildren: children,
        );

  static const String name = 'RepositoryRoute';

  static const PageInfo<RepositoryRouteArgs> page =
      PageInfo<RepositoryRouteArgs>(name);
}

class RepositoryRouteArgs {
  const RepositoryRouteArgs({
    this.search,
    this.key,
  });

  final String? search;

  final Key? key;

  @override
  String toString() {
    return 'RepositoryRouteArgs{search: $search, key: $key}';
  }
}

/// generated route for
/// [VocabularyItemEditor]
class VocabularyItemEditorRoute
    extends PageRouteInfo<VocabularyItemEditorRouteArgs> {
  VocabularyItemEditorRoute({
    Key? key,
    required ({
      DefinitionEntity definition,
      PartOfSpeech partOfSpeech
    }) definition,
    List<PageRouteInfo>? children,
  }) : super(
          VocabularyItemEditorRoute.name,
          args: VocabularyItemEditorRouteArgs(
            key: key,
            definition: definition,
          ),
          initialChildren: children,
        );

  static const String name = 'VocabularyItemEditorRoute';

  static const PageInfo<VocabularyItemEditorRouteArgs> page =
      PageInfo<VocabularyItemEditorRouteArgs>(name);
}

class VocabularyItemEditorRouteArgs {
  const VocabularyItemEditorRouteArgs({
    this.key,
    required this.definition,
  });

  final Key? key;

  final ({DefinitionEntity definition, PartOfSpeech partOfSpeech}) definition;

  @override
  String toString() {
    return 'VocabularyItemEditorRouteArgs{key: $key, definition: $definition}';
  }
}

/// generated route for
/// [VocabularyLookup]
class VocabularyLookupRoute extends PageRouteInfo<void> {
  const VocabularyLookupRoute({List<PageRouteInfo>? children})
      : super(
          VocabularyLookupRoute.name,
          initialChildren: children,
        );

  static const String name = 'VocabularyLookupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
