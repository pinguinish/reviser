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
    WordEditorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WordEditorScreen(),
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
/// [WordEditorScreen]
class WordEditorRoute extends PageRouteInfo<void> {
  const WordEditorRoute({List<PageRouteInfo>? children})
      : super(
          WordEditorRoute.name,
          initialChildren: children,
        );

  static const String name = 'WordEditorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
