import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:reviser/features/app/widgets/home_screen.dart";
import 'package:reviser/features/search/application/widgets/_temp_/repository_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitialRoute.page, initial: true),
        AutoRoute(page: RepositoryRoute.page),
      ];
}