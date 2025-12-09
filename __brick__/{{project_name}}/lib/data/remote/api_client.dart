import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:{{project_name}}/data/data.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/users')
  Future<List<UserModel>> getUsers();

  @GET('/users/{id}')
  Future<UserModel> getUser(@Path('id') int id);
}
