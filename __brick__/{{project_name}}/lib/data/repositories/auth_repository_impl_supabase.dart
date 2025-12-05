import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:{{project_name}}/domain/repositories/auth_repository.dart';

class AuthRepositoryImplSupabase implements AuthRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<void> signIn(String email, String password) async {
    await _supabase.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  @override
  Future<bool> get isSignedIn async {
    return _supabase.auth.currentUser != null;
  }
}
