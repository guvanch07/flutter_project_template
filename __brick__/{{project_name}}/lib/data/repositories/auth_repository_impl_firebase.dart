import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:{{project_name}}/data/preferences_key.dart';
import 'package:{{project_name}}/domain/domain.dart';
import 'package:{{project_name}}/injection.dart';
import 'package:{{project_name}}/internal/internal.dart' hide AppBackupManager;
import 'package:{{project_name}}/presentation/cubits/cubits.dart';

class AuthRepositoryImplFirebase implements AuthRepository {
  // TODO: Add your backend URLs here
  static const String _updateCustomerUrl = AppConstants.updateCustomerUrl;
  static const String _getDataByHashUrl = AppConstants.getDataByHashUrl;
  static const String _getTokenByHashUrl = AppConstants.getTokenByHashUrl;
  static const String _getDataByDeviceIdUrl = AppConstants.getDataByDeviceIdUrl;
  static const String _getTokenByDeviceIdUrl =
      AppConstants.getTokenByDeviceIdUrl;

  final FirebaseAuth firebaseAuth;
  final Dio dio;

  const AuthRepositoryImplFirebase({
    required this.firebaseAuth,
    required this.dio,
  });

  SecureStorageRepository get _secureStorage =>
      getIt<SecureStorageRepository>();
  PreferencesRepository get _prefs => getIt<PreferencesRepository>();
  LogCubit get _logCubit => getIt<LogCubit>();

  CollectionReference get _authTokensCollection =>
      FirebaseFirestore.instance.collection('auth_tokens');
  CollectionReference get _authDeviceIdCollection =>
      FirebaseFirestore.instance.collection('auth_device_ids');

  @override
  bool get isSignedIn => firebaseAuth.currentUser != null;

  @override
  Future<Either<BaseFailure, firebase_auth.User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        return const Left(
          RepositoryFailure('Sign in failed - no user returned', null),
        );
      }

      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthException(e, email: email));
    } catch (e) {
      return Left(RepositoryFailure(e.toString(), e));
    }
  }

  @override
  Future<Either<BaseFailure, String>> linkEmailToAnonymousAccount({
    required String email,
    required String password,
  }) async {
    try {
      final currentUser = firebaseAuth.currentUser;

      if (currentUser == null) {
        return const Left(
          RepositoryFailure('No user is currently signed in', null),
        );
      }

      if (!currentUser.isAnonymous) {
        return const Left(RepositoryFailure('User is not anonymous', null));
      }

      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      final userCredential = await currentUser.linkWithCredential(credential);
      final uid = userCredential.user?.uid ?? '';
      return Right(uid);
    } on FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthException(e, email: email));
    } catch (e) {
      return Left(RepositoryFailure(e.toString(), e));
    }
  }

  @override
  Future<Either<BaseFailure, void>> signOut() async {
    try {
      await firebaseAuth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(RepositoryFailure(e.toString(), e));
    }
  }

  @override
  Future<Either<BaseFailure, firebase_auth.User>> getCurrentUser() async {
    try {
      firebase_auth.User? currentUser;
      try {
        currentUser = await firebaseAuth
            .authStateChanges()
            .firstWhere((u) => u != null)
            .timeout(const Duration(seconds: 2));
      } catch (_) {}
      currentUser ??= firebaseAuth.currentUser;

      _log('uid: ${currentUser?.uid}');

      if (currentUser != null) {
        final firebaseAuthHash = Platform.isIOS
            ? await _secureStorage.read(
                PreferencesKey.firebaseAuthHash,
                synced: true,
              )
            : await _prefs.read(PreferencesKey.firebaseAuthHash);

        _log(
          'currentUser found: ${currentUser.uid}. firebaseAuthHash: $firebaseAuthHash',
        );

        if (firebaseAuthHash == null) {
          final hashedUid = currentUser.uid + const Uuid().v4();
          if (Platform.isIOS) {
            await _secureStorage.write(
              PreferencesKey.firebaseAuthHash,
              hashedUid,
              synced: true,
            );
          } else {
            await _prefs.write(PreferencesKey.firebaseAuthHash, hashedUid);
            unawaited(AppBackupManager.dataChanged());
          }
          _log('creating firebaseAuthHash record for new firebase user');
          await _saveAuthHashToCollection(hashedUid, currentUser.uid);
        }

        if (Platform.isAndroid) {
          try {
            final deviceId = await DeviceUtil.getStableDeviceId();
            _log('saving deviceId mapping for existing user');
            await _saveDeviceIdToCollection(deviceId, currentUser.uid);
          } catch (_) {}
        }
      }

      if (currentUser == null) {
        String? token;
        final firebaseAuthHash = Platform.isIOS
            ? await _secureStorage.read(
                PreferencesKey.firebaseAuthHash,
                synced: true,
              )
            : await _prefs.read(PreferencesKey.firebaseAuthHash);

        _log('currentUser not found. firebaseAuthHash: $firebaseAuthHash');

        if (firebaseAuthHash != null) {
          token = await _getTokenByAuthHash(firebaseAuthHash);
        }

        if (token != null) {
          _log(
            'restoring from custom token. firebaseAuthHash: $firebaseAuthHash',
          );
          await firebaseAuth.signInWithCustomToken(token);
        } else {
          String? installationToken;

          if (Platform.isAndroid) {
            try {
              final deviceId = await DeviceUtil.getStableDeviceId();
              _log('trying restore by deviceId: $deviceId');
              installationToken = await _getTokenByDeviceId(deviceId);
            } catch (_) {}
          }

          if (installationToken != null) {
            _log('restoring from custom token via deviceId');
            await firebaseAuth.signInWithCustomToken(installationToken);
          } else {
            _log('token not found. signing in anonymously');
            await firebaseAuth.signInAnonymously();
          }
        }

        currentUser = firebaseAuth.currentUser;
        if (firebaseAuthHash == null && currentUser != null) {
          final hashedUid = currentUser.uid + const Uuid().v4();
          if (Platform.isIOS) {
            await _secureStorage.write(
              PreferencesKey.firebaseAuthHash,
              hashedUid,
              synced: true,
            );
          } else {
            await _prefs.write(PreferencesKey.firebaseAuthHash, hashedUid);
            unawaited(AppBackupManager.dataChanged());
          }
          _log('creating firebaseAuthHash record for new firebase user');
          await _saveAuthHashToCollection(hashedUid, currentUser.uid);
        }

        if (Platform.isAndroid && currentUser != null) {
          try {
            final deviceId = await DeviceUtil.getStableDeviceId();
            await _saveDeviceIdToCollection(deviceId, currentUser.uid);
          } catch (_) {}
        }
      }

      if (currentUser == null) {
        return const Left(
          RepositoryFailure(
            'Something went wrong with getting current user',
            null,
          ),
        );
      }

      // Try to refresh the token to verify if the account is valid
      await currentUser.getIdToken(true);

      return Right(currentUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-token-expired' ||
          e.code == 'user-disabled' ||
          e.code == 'user-not-found') {
        return Left(
          RepositoryFailure(
            'Sorry, your account is disabled. Please contact support.',
            e,
          ),
        );
      }
      return Left(_handleFirebaseAuthException(e));
    } catch (e) {
      return Left(RepositoryFailure(e.toString(), e));
    }
  }

  void _log(String message) {
    _logCubit.addLog(message);
    debugPrint('[AuthRepository]: $message');
  }

  BaseFailure _handleFirebaseAuthException(
    FirebaseAuthException e, {
    String? email,
  }) {
    switch (e.code) {
      case 'invalid-email':
        return RepositoryFailure('The email address is badly formatted.', e);
      case 'user-disabled':
        return RepositoryFailure(
          'This user account has been disabled by an administrator.',
          e,
        );
      case 'user-not-found':
        return const SignInUserNotExistFailure();
      case 'wrong-password':
        return const SignInIncorrectPasswordFailure();
      case 'email-already-in-use':
        return RepositoryFailure('This email is already in use.', e);
      case 'account-exists-with-different-credential':
        return RepositoryFailure(
          'An account already exists with the same email address.',
          e,
        );
      case 'invalid-credential':
        return RepositoryFailure(
          'The credential is malformed or has expired.',
          e,
        );
      case 'operation-not-allowed':
        return RepositoryFailure('This operation is not allowed.', e);
      case 'weak-password':
        return RepositoryFailure('The password is too weak.', e);
      case 'user-token-expired':
        return RepositoryFailure(
          'User session has expired. Please sign in again.',
          e,
        );
      case 'user-token-revoked':
        return RepositoryFailure(
          'User credentials have been revoked. Please sign in again.',
          e,
        );
      case 'requires-recent-login':
        return RepositoryFailure(
          'This operation requires recent authentication. Please sign in again.',
          e,
        );
      default:
        return RepositoryFailure('Firebase auth error: ${e.message}', e);
    }
  }

  Future<void> _saveAuthHashToCollection(String authHash, String uuid) async {
    try {
      await _authTokensCollection.doc(authHash).set({
        'ownerId': uuid,
        'created_at': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      _log('Error saving auth hash: $e');
    }
  }

  Future<String?> _getTokenByAuthHash(String firebaseAuthHash) async {
    // Check if URL is configured
    if (_getTokenByHashUrl.contains('YOUR_')) return null;

    final isExist = await _isDataExistByAuthHash(firebaseAuthHash);
    if (!isExist) return null;

    try {
      final response = await dio.get(
        _getTokenByHashUrl,
        queryParameters: {'hash': firebaseAuthHash},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode != 200) {
        throw RepositoryFailure(
          'Failed to get token by hash',
          'Status code: ${response.statusCode}',
        );
      }

      return response.data['token'];
    } catch (e) {
      throw ExceptionUtil.toDomainFailure(e);
    }
  }

  Future<bool> _isDataExistByAuthHash(String firebaseAuthHash) async {
    // Check if URL is configured
    if (_getDataByHashUrl.contains('YOUR_')) return false;

    try {
      final response = await dio.get(
        _getDataByHashUrl,
        queryParameters: {'hash': firebaseAuthHash},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode != 200) {
        throw RepositoryFailure(
          'Failed to check if data exists',
          'Status code: ${response.statusCode}',
        );
      }

      return response.data['isExist'];
    } catch (e) {
      throw ExceptionUtil.toDomainFailure(e);
    }
  }

  Future<void> _saveDeviceIdToCollection(String deviceId, String uuid) async {
    try {
      await _authDeviceIdCollection.doc(deviceId).set({
        'ownerId': uuid,
        'created_at': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      _log('Error saving device id: $e');
    }
  }

  Future<String?> _getTokenByDeviceId(String deviceId) async {
    // Check if URL is configured
    if (_getTokenByDeviceIdUrl.contains('YOUR_')) return null;

    final isExist = await _isDataExistByDeviceId(deviceId);
    if (!isExist) return null;

    try {
      final response = await dio.get(
        _getTokenByDeviceIdUrl,
        queryParameters: {'deviceId': deviceId},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode != 200) {
        throw RepositoryFailure(
          'Failed to get token by deviceId',
          'Status code: ${response.statusCode}',
        );
      }

      return response.data['token'];
    } catch (e) {
      throw ExceptionUtil.toDomainFailure(e);
    }
  }

  Future<bool> _isDataExistByDeviceId(String deviceId) async {
    // Check if URL is configured
    if (_getDataByDeviceIdUrl.contains('YOUR_')) return false;

    try {
      final response = await dio.get(
        _getDataByDeviceIdUrl,
        queryParameters: {'deviceId': deviceId},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode != 200) {
        throw RepositoryFailure(
          'Failed to check if deviceId data exists',
          'Status code: ${response.statusCode}',
        );
      }

      return response.data['isExist'];
    } catch (e) {
      throw ExceptionUtil.toDomainFailure(e);
    }
  }
}
