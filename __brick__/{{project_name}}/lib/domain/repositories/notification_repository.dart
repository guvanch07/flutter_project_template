import 'package:either_dart/either.dart';
import 'package:{{project_name}}/domain/entities/failures.dart';

abstract class NotificationRepository {
  /// Initialize notifications system
  /// Returns Either a failure or true if initialization was successful
  Future<Either<BaseFailure, bool>> initializeNotifications();

  /// Request permission to show notifications
  /// Returns Either a failure or true if permission was granted
  Future<Either<BaseFailure, bool>> requestNotificationPermission();

  /// Subscribe to a topic for push notifications
  /// Returns Either a failure or true if subscription was successful
  Future<Either<BaseFailure, bool>> subscribeToTopic(String topic);

  /// Unsubscribe from a topic for push notifications
  /// Returns Either a failure or true if unsubscription was successful
  Future<Either<BaseFailure, bool>> unsubscribeFromTopic(String topic);

  /// Get the FCM token for this device
  /// Returns Either a failure or the token as a String
  Future<Either<BaseFailure, String>> getToken();

  /// Update current FCM token and save to Firestore
  /// Returns Either a failure or true if token was updated successfully
  Future<Either<BaseFailure, bool>> updateCurrentFcmToken();

  /// Setup FCM token listener to save tokens to Firestore
  /// Returns Either a failure or true if setup was successful
  Future<Either<BaseFailure, bool>> setupFcmTokenListener();

  /// Reset FCM token listener initialization flag
  void resetFcmTokenListener();

  /// Configure how to handle foreground notifications
  void configureForegroundNotificationHandling();

  /// Handle a notification that was tapped by the user
  void handleNotificationTap(String? payload);
}
