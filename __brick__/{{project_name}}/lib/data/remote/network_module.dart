import 'package:dio/dio.dart';

abstract class NetworkModule {
  static Dio provideDio() {
    final dio = Dio();
    // Add interceptors here if needed
    return dio;
  }
}
