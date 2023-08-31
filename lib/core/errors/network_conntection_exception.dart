abstract interface class NetworkException implements Exception {
  NetworkException({this.message, required this.exceptionMessage});
  final String? message;
  final String exceptionMessage;

  @override
  String toString() => message ?? exceptionMessage;
}

class NoInternetConnection implements NetworkException {
  const NoInternetConnection([this.message]);

  @override
  final String? message;

  @override
  final String exceptionMessage =
      "NoInternetConnection occured. Check your internet connection";
}

class BadInternetConnection implements NetworkException {
  const BadInternetConnection([this.message]);

  @override
  final String? message;

  @override
  final String exceptionMessage =
      "BadInternetConnection occured. Try again later";
}
