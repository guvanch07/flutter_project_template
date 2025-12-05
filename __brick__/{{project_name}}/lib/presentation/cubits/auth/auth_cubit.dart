import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name}}/domain/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthInitial());

  Future<void> checkAuthStatus() async {
    try {
      final isSignedIn = await _authRepository.isSignedIn;
      if (isSignedIn) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (_) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _authRepository.signIn(email, password);
      emit(AuthAuthenticated());
    } catch (_) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(AuthUnauthenticated());
  }
}
