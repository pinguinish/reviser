import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/features/initialization/initialization.dart';
import 'package:reviser/features/initialization/widgets/app_error.dart';
import 'package:reviser/features/initialization/widgets/dependencies_scope.dart';
import 'package:reviser/features/search/application/widgets/search_scope.dart';

import 'features/app/widgets/reviser_app.dart';

void main() => runZonedGuarded(
      () {
        initializeApp(
          onSuccess: (dependencies) => runApp(
            DependenciesScope(
              dependencies: dependencies,
              child: const SearchScope(child: ReviserApp()),
            ),
          ),
          onError: (e, s) {
            logger.f("Caught error in initialization");
            runApp(AppError(error: e));
          },
        );
      },
      (e, s) {
        logger.e("Caught error in runZonedGuarded", error: e, stackTrace: s);
      },
    );
