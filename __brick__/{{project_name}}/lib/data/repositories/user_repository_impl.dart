import 'package:{{project_name}}/data/remote/api_client.dart';
import 'package:{{project_name}}/domain/entities/user.dart';
import 'package:{{project_name}}/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiClient _apiClient;

  UserRepositoryImpl(this._apiClient);

  @override
  Future<List<User>> getUsers() async => await _apiClient.getUsers();

  @override
  Future<User> getUser(int id) async => await _apiClient.getUser(id);
}
