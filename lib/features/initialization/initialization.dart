import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:reviser/core/bloc/observer.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/features/initialization/models/dependencies.dart';

Future<void> initializeApp({
  required FutureOr<void> Function(Dependencies dependencies) onSuccess,
  required void Function(Object error, StackTrace stackTrace) onError,
}) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    if (kReleaseMode) Logger.level = Level.info;
    // if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    //   WidgetsFlutterBinding.ensureInitialized();
    //   setWindowMinSize(const Size(800, 500));
    // }
    Bloc.observer = AppBlocObserver();
    _catchDartFlutterErrors();
    onSuccess(MutableDependencies());
  } on Object catch (e, s) {
    onError(e, s);
    logger.e("Failed to initialize app", error: e, stackTrace: s);
    rethrow;
  }
}

void _catchDartFlutterErrors() {
  FlutterError.onError = (details) {
    logger.e(
      "Flutter error",
      error: details.exception,
      stackTrace: details.stack,
    );
  };
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    logger.e(
      "PlatformDispatcher error",
      error: error,
      stackTrace: stackTrace,
    );
    return true;
  };
}
