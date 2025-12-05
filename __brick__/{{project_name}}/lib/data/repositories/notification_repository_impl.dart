import 'package:either_dart/either.dart';
import 'package:{{project_name}}/domain/entities/failures.dart';
import 'package:{{project_name}}/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  @override
  Future<Either<BaseFailure, bool>> initializeNotifications() async {
    return const Right(true);
  }

  @override
  Future<Either<BaseFailure, bool>> requestNotificationPermission() async {
    return const Right(true);
  }

  @override
  Future<Either<BaseFailure, bool>> subscribeToTopic(String topic) async {
    return const Right(true);
  }

  @override
  Future<Either<BaseFailure, bool>> unsubscribeFromTopic(String topic) async {
    return const Right(true);
  }

  @override
  Future<Either<BaseFailure, String>> getToken() async {
    return const Right('dummy_token');
  }

  @override
  Future<Either<BaseFailure, bool>> updateCurrentFcmToken() async {
    return const Right(true);
  }

  @override
  Future<Either<BaseFailure, bool>> setupFcmTokenListener() async {
    return const Right(true);
  }

  @override
  void resetFcmTokenListener() {}

  @override
  void configureForegroundNotificationHandling() {}

  @override
  void handleNotificationTap(String? payload) {}
}
