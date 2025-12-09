// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:{{project_name}}/domain/entities/failures.dart';
import 'package:{{project_name}}/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  bool _isFcmTokenListenerInitialized = false;

  @override
  Future<Either<BaseFailure, bool>> initializeNotifications() async {
    try {
      // Initialize Firebase Messaging
      await FirebaseMessaging.instance.setAutoInitEnabled(true);
      return const Right(true);
    } catch (e) {
      return Left(
        NotificationFailure('Failed to initialize notifications: $e'),
      );
    }
  }

  @override
  Future<Either<BaseFailure, bool>> requestNotificationPermission() async {
    try {
      final settings = await FirebaseMessaging.instance.requestPermission();
      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(NotificationFailure(e.toString()));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> subscribeToTopic(String topic) async {
    try {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
      return const Right(true);
    } catch (e) {
      return Left(NotificationFailure('Failed to subscribe to topic: $e'));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> unsubscribeFromTopic(String topic) async {
    try {
      await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
      return const Right(true);
    } catch (e) {
      return Left(NotificationFailure('Failed to unsubscribe from topic: $e'));
    }
  }

  @override
  Future<Either<BaseFailure, String>> getToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token == null) {
        return const Left(NotificationFailure('Failed to get FCM token'));
      }
      return Right(token);
    } catch (e) {
      return Left(NotificationFailure(e.toString()));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> updateCurrentFcmToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await _saveTokenToFirestore(user.uid, token);
        }
      }
      return const Right(true);
    } catch (e) {
      return Left(NotificationFailure('Failed to update FCM token: $e'));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> setupFcmTokenListener() async {
    try {
      // Check if already initialized
      if (_isFcmTokenListenerInitialized) {
        debugPrint('FCM token listener already initialized');
        // Even if listener is initialized, try to update current token
        await updateCurrentFcmToken();
        return const Right(true);
      }

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return const Left(NotificationFailure('User not authenticated'));
      }

      // Update current token first
      await updateCurrentFcmToken();

      // Subscribe to token refresh
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          _saveTokenToFirestore(currentUser.uid, newToken);
        }
      });

      // Mark as initialized
      _isFcmTokenListenerInitialized = true;
      return const Right(true);
    } catch (e) {
      return Left(
        NotificationFailure('Failed to setup FCM token listener: $e'),
      );
    }
  }

  @override
  void resetFcmTokenListener() {
    _isFcmTokenListenerInitialized = false;
  }

  @override
  void configureForegroundNotificationHandling() {
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  @override
  void handleNotificationTap(String? payload) {
    if (payload != null) {
      debugPrint('Notification tapped with payload: $payload');
      // Handle notification navigation logic here
    }
  }

  /// Save FCM token to Firestore subcollection under user
  Future<void> _saveTokenToFirestore(String uid, String token) async {
    try {
      await FirebaseFirestore.instance
          .collection('rc_customers')
          .doc(uid)
          .collection('tokens')
          .doc(token) // token as document ID
          .set({
            'token': token,
            'platform': Platform.isIOS ? 'ios' : 'android',
            'created_at': FieldValue.serverTimestamp(),
          });
    } catch (e) {
      try {
        // Safe check for Crashlytics since it might be optional
        if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
          unawaited(
            FirebaseCrashlytics.instance.recordError(e, StackTrace.current),
          );
        }
      } catch (_) {}
    }
  }
}

// This function must be declared outside of any class
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling a background message: ${message.messageId}');
  debugPrint('Message data: ${message.data}');
  debugPrint('Message notification: ${message.notification?.title}');

  // Note: We don't need to show a notification here because Firebase automatically
  // displays notifications when the app is in the background
}
