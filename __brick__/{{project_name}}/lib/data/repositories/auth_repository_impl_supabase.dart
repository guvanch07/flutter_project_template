import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/domain/repositories/auth_repository.dart';

class AuthRepositoryImplSupabase implements AuthRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<Either<BaseFailure, void>> signOut() async {
    try {
      await _supabase.auth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(BaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<BaseFailure, firebase_auth.User>> getCurrentUser() async {
    // Note: Supabase uses its own User type, not Firebase's User
    // This implementation returns a failure since Supabase doesn't use Firebase Auth
    return Left(
      BaseFailure(
        message:
            'getCurrentUser is not supported for Supabase implementation. '
            'Use Supabase.instance.client.auth.currentUser instead.',
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
      final response = await _supabase.auth.updateUser(
        UserAttributes(email: email, password: password),
      );
      if (response.user != null) {
        return Right(response.user!.id);
      }
      return Left(BaseFailure(message: 'Failed to link email to account'));
    } catch (e) {
      return Left(BaseFailure(message: e.toString()));
    }
  }
}
