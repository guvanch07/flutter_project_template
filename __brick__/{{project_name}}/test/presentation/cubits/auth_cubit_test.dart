import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/domain/repositories/auth_repository.dart';
import 'package:{{project_name}}/presentation/cubits/auth/auth_cubit.dart';

class MockAuthRepository implements AuthRepository {
  bool _isSignedIn = false;

  @override
  Future<bool> get isSignedIn async => _isSignedIn;

  @override
  Future<void> signIn(String email, String password) async {
    if (email == 'error') throw Exception('Sign in failed');
    _isSignedIn = true;
  }

  @override
  Future<void> signOut() async {
    _isSignedIn = false;
  }

  void setSignedIn(bool value) {
    _isSignedIn = value;
  }
}

void main() {
  group('AuthCubit', () {
    late AuthCubit authCubit;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      authCubit = AuthCubit(authRepository: mockAuthRepository);
    });

    tearDown(() {
      authCubit.close();
    });

    test('initial state is AuthInitial', () {
      expect(authCubit.state, AuthInitial());
    });

    blocTest<AuthCubit, AuthState>(
      'emits [AuthAuthenticated] when checkAuthStatus is called and user is signed in',
      build: () {
        mockAuthRepository.setSignedIn(true);
        return authCubit;
      },
      act: (cubit) => cubit.checkAuthStatus(),
      expect: () => [AuthAuthenticated()],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [AuthUnauthenticated] when checkAuthStatus is called and user is not signed in',
      build: () {
        mockAuthRepository.setSignedIn(false);
        return authCubit;
      },
      act: (cubit) => cubit.checkAuthStatus(),
      expect: () => [AuthUnauthenticated()],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [AuthAuthenticated] when signIn is successful',
      build: () => authCubit,
      act: (cubit) => cubit.signIn('test@example.com', 'password'),
      expect: () => [AuthAuthenticated()],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [AuthUnauthenticated] when signIn fails',
      build: () => authCubit,
      act: (cubit) => cubit.signIn('error', 'password'),
      expect: () => [AuthUnauthenticated()],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [AuthUnauthenticated] when signOut is called',
      build: () => authCubit,
      act: (cubit) => cubit.signOut(),
      expect: () => [AuthUnauthenticated()],
    );
  });
}
