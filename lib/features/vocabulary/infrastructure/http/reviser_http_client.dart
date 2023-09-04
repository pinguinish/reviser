import 'package:dio/dio.dart';

/// It's really silly so consider to make it better 
/// e.g a specific client for a specific remote source
abstract class ReviserHttpClient {
  static final Dio client = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
}
