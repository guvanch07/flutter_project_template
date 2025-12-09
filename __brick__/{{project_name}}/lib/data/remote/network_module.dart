import 'package:dio/dio.dart';

abstract class NetworkModule {
  static Dio provideDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.example.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    return dio;
  }
}
