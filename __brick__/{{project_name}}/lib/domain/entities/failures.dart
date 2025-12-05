import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

// Placeholder for BaseError if it was intended to be used, 
// otherwise adapting ServerFailure to use generic message for now 
// or assuming BaseError is defined elsewhere. 
// For this template, I'll define a simple BaseError to make the code compile.
class BaseError {
  final String message;
  final Map<String, dynamic>? errors;
  BaseError({required this.message, this.errors});
}

abstract class BaseFailure extends Equatable implements Exception {
  final String message;
  const BaseFailure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends BaseFailure {
  final BaseError responseError;

  ServerFailure(this.responseError)
      : super(responseError.message.isNotEmpty
            ? responseError.message
            : '');
}

class RepositoryFailure extends BaseFailure {
  final dynamic error;

  const RepositoryFailure(super.message, this.error);
}

class StorageFailure extends BaseFailure {
  const StorageFailure(super.message);
}

class NotificationFailure extends BaseFailure {
  const NotificationFailure(super.message);
}

class DioFailure extends BaseFailure {
  final DioException error;

  DioFailure(
    this.error,
  ) : super('DioFailure: ${error.message}');
}

class SignInAccountAlreadyDeletedFailure extends BaseFailure {
  final String userEmail;

  const SignInAccountAlreadyDeletedFailure({
    required this.userEmail,
  }) : super('SignInAccountAlreadyDeletedFailure');
}

class SignInUserNotExistFailure extends BaseFailure {
  const SignInUserNotExistFailure() : super('SignInUserNotExist');
}

class SignInIncorrectPasswordFailure extends BaseFailure {
  const SignInIncorrectPasswordFailure()
      : super('SignInIncorrectPasswordFailure');
}

class PhotoSearchHistoryFailure extends BaseFailure {
  const PhotoSearchHistoryFailure([String? message])
      : super(message ?? 'Photo search history failure');
}

class NoInternetConnectionFailure extends BaseFailure {
  const NoInternetConnectionFailure() : super('No internet connection');
}

class TimeoutFailure extends BaseFailure {
  const TimeoutFailure() : super('Request timed out');
}

class UnknownFailure extends BaseFailure {
  const UnknownFailure([String? message])
      : super(message ?? 'Unknown error occurred');
}

class NoObjectFoundFailure extends BaseFailure {
  const NoObjectFoundFailure() : super('No object found');
}

class CollectionExistsFailure extends BaseFailure {
  const CollectionExistsFailure(super.message);
}

class NicknameTakenFailure extends BaseFailure {
  const NicknameTakenFailure() : super('Nickname is already taken.');
}
