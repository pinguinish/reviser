


class NotFoundException implements Exception {

  final String message;

  const NotFoundException(this.message);

  @override
  String toString() => "[NOT FOUND EXCEPTION]: $message";
}


class NotFoundWordException extends NotFoundException {
  final String word;
  NotFoundWordException({required this.word}) : super("The word '$word' was not found in the dictionary");
}