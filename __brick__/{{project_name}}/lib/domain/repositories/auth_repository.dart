// ignore_for_file: one_member_abstracts

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:{{project_name}}/domain/entities/entities.dart';

abstract interface class AuthRepository {
  /// Returns whether user is currently signed in
  bool get isSignedIn;

  /// Sign in with email and password
  Future<Either<BaseFailure, firebase_auth.User>> signIn({
    required String email,
    required String password,
  });

  Future<Either<BaseFailure, void>> signOut();

  /// Returns current user
  Future<Either<BaseFailure, firebase_auth.User>> getCurrentUser();

  /// Links an email and password to an anonymous account
  Future<Either<BaseFailure, String>> linkEmailToAnonymousAccount({
    required String email,
    required String password,
  });
}
