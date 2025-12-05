import 'package:firebase_auth/firebase_auth.dart';
import 'package:{{project_name}}/domain/repositories/auth_repository.dart';

class AuthRepositoryImplFirebase implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<bool> get isSignedIn async {
    return _firebaseAuth.currentUser != null;
  }
}
