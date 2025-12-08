import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/domain/repositories/auth_repository.dart';
import 'package:{{project_name}}/presentation/cubits/auth/auth_cubit.dart';

class FakeUser extends Fake implements firebase_auth.User {
  @override
  String get uid => 'test_uid';
}

class MockAuthRepository implements AuthRepository {
  bool _isSignedIn = false;

  @override
  bool get isSignedIn => _isSignedIn;

  @override
  Future<Either<BaseFailure, firebase_auth.User>> signIn({
    required String email,
    required String password,
  }) async {
    if (email == 'error') return Left(UnknownFailure('Sign in failed'));
    _isSignedIn = true;
    return Right(FakeUser());
  }

  @override
  Future<Either<BaseFailure, void>> signOut() async {
    _isSignedIn = false;
    return const Right(null);
  }

  @override
  Future<Either<BaseFailure, firebase_auth.User>> getCurrentUser() async {
    if (_isSignedIn) {
      return Right(FakeUser());
    }
    return Left(UnknownFailure('No user'));
  }

  @override
  Future<Either<BaseFailure, String>> linkEmailToAnonymousAccount({
    required String email,
    required String password,
  }) async => const Right('test_uid');

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
