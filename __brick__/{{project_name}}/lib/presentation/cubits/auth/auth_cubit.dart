// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name}}/domain/repositories/repositories.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthInitial());

  Future<void> checkAuthStatus() async {
    try {
      final isSignedIn = _authRepository.isSignedIn;
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
    final result = await _authRepository.signIn(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthUnauthenticated()),
      (user) => emit(AuthAuthenticated()),
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(AuthUnauthenticated());
  }
}
