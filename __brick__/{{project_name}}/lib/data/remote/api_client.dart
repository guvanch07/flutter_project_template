// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:{{project_name}}/data/models/user_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/users")
  Future<List<UserModel>> getUsers();

  @GET("/users/{id}")
  Future<UserModel> getUser(@Path("id") int id);
}
