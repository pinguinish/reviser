import 'package:flutter/material.dart';
import 'package:reviser/core/router/router.dart';
import 'package:reviser/features/initialization/widgets/dependencies_scope.dart';

abstract class Dependencies {
  const Dependencies();

  static Dependencies of(BuildContext context) =>
      DependenciesScope.of(context, listen: false);

  abstract final AppRouter router;
}

final class ImmutableDependencies extends Dependencies {
  ImmutableDependencies();

  @override
  late final AppRouter router = AppRouter();
}
