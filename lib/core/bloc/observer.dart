import 'package:bloc/bloc.dart';
import 'package:reviser/core/utils/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e(
      "Caught error in ${bloc.runtimeType}",
      error: error,
      stackTrace: stackTrace,
      time: DateTime.now(),
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    logger.d("[${bloc.runtimeType}]: $event");
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.i(
        "[${bloc.runtimeType}]: ${transition.currentState.runtimeType} -> ${transition.nextState.runtimeType}");
    super.onTransition(bloc, transition);
  }
}
