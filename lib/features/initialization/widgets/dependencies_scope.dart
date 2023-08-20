import 'package:flutter/material.dart';
import 'package:reviser/core/utils/mixins/scope_mixin.dart';
import 'package:reviser/features/initialization/models/dependencies.dart';

final class DependenciesScope extends InheritedWidget {
  const DependenciesScope({
    super.key,
    required this.dependencies,
    required super.child,
  });

  final Dependencies dependencies;

  static Dependencies of(BuildContext context, {bool listen = false}) =>
      ScopeMixin.scopeOf<DependenciesScope>(context).dependencies;

  static Dependencies? maybeOf(BuildContext context, {bool listen = false}) =>
      ScopeMixin.scopeMaybeOf<DependenciesScope>(context)?.dependencies;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
