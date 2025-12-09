import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/domain/repositories/auth_repository.dart';

class AuthRepositoryImplSupabase implements AuthRepository {
  final SupabaseClient supabase;

  const AuthRepositoryImplSupabase({required this.supabase});

  @override
  bool get isSignedIn => supabase.auth.currentUser != null;

  @override
  Future<Either<BaseFailure, void>> signOut() async {
    try {
      await supabase.auth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(RepositoryFailure(e.toString(), e));
    }
  }

  @override
  Future<Either<BaseFailure, firebase_auth.User>> signIn({
    required String email,
    required String password,
  }) async {
    // Note: This returns a failure because we can't return a Firebase User
    // when signing in with Supabase. The generic type prevents this.
    // In a real project, you would change AuthRepository to return a domain User entity
    // or a generic User type, rather than firebase_auth.User.

    try {
      await supabase.auth.signInWithPassword(email: email, password: password);

      // We can't return a firebase_auth.User here.
      // This is a template design limitation where the interface is tied to Firebase.
      return const Left(
        RepositoryFailure(
          'Cannot return Firebase User from Supabase implementation. '
          'Update AuthRepository to use domain User entity.',
          null,
        ),
      );
    } catch (e) {
      return Left(RepositoryFailure(e.toString(), e));
    }
  }

  @override
  Future<Either<BaseFailure, firebase_auth.User>> getCurrentUser() async {
    // Note: Supabase uses its own User type, not Firebase's User
    // This implementation returns a failure since Supabase doesn't use Firebase Auth
    return const Left(
      RepositoryFailure(
        'getCurrentUser is not supported for Supabase implementation. '
        'Use Supabase.instance.client.auth.currentUser instead.',
        null,
      ),
    );
  }

  @override
  Future<Either<BaseFailure, String>> linkEmailToAnonymousAccount({
    required String email,
    required String password,
  }) async {
    try {
      // Supabase doesn't have anonymous accounts like Firebase
      // Instead, we can update the user's email/password
      final response = await supabase.auth.updateUser(
        UserAttributes(email: email, password: password),
      );
      if (response.user != null) {
        return Right(response.user!.id);
      }
      return const Left(
        RepositoryFailure('Failed to link email to account', null),
      );
    } catch (e) {
      return Left(RepositoryFailure(e.toString(), e));
    }
  }
}
