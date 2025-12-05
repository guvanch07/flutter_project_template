import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/data/remote/api_client.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ApiClient get apiClient(Dio dio) => ApiClient(dio);
}
