import 'package:flutter/material.dart';

mixin ScopeMixin<T extends Widget> on Widget {
  static T? scopeMaybeOf<T extends InheritedWidget>(
    BuildContext context, {
    bool listen = true,
  }) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<T>()
          : context.getInheritedWidgetOfExactType<T>();

  static T scopeOf<T extends InheritedWidget>(
    BuildContext context, {
    bool listen = true,
  }) =>
      scopeMaybeOf<T>(context, listen: listen) ??
      notFoundInheritedWidgetOfExactType<T>();

  static Never
      notFoundInheritedWidgetOfExactType<T extends InheritedWidget>() =>
          throw ArgumentError(
            'Out of scope, not found inherited widget '
                'a $T of the exact type',
            'out_of_scope',
          );
}
