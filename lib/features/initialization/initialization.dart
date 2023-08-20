import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/features/initialization/models/dependencies.dart';

Future<void> initializeApp({
  required FutureOr<void> Function(Dependencies dependencies) onSuccess,
  required void Function(Object error, StackTrace stackTrace) onError,
}) async {
  try {
    if (kReleaseMode) Logger.level = Level.info;
    // if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    //   WidgetsFlutterBinding.ensureInitialized();
    //   setWindowMinSize(const Size(800, 500));
    // }
    _catchDartFlutterErrors();
    onSuccess(const ImmutableDependencies());
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
