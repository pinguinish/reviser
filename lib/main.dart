import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/features/initialization/initialization.dart';
import 'package:reviser/features/initialization/widgets/app_error.dart';
import 'package:reviser/features/initialization/widgets/dependencies_scope.dart';

import 'features/app/widgets/reviser_app.dart';

void main() => runZonedGuarded(
      () {
        initializeApp(
          onSuccess: (dependencies) => runApp(
            DependenciesScope(
              dependencies: dependencies,
              child: const ReviserApp(),
            ),
          ),
          onError: (e, s) {
            runApp(AppError(error: e));
          },
        );
      },
      (e, s) {
        logger.e("Caught error in runZonedGuarded", error: e, stackTrace: s);
      },
    );