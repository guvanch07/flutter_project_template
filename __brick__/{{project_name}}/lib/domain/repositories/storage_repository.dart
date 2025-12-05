import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';

abstract interface class StorageRepository {
  /// Upload a file to Firebase Storage
  /// Returns the download URL for the uploaded file
  Future<Either<BaseFailure, String>> uploadFile({
    required File file,
    required String path,
    String? contentType,
  });

  /// Delete a file from Firebase Storage
  Future<Either<BaseFailure, bool>> deleteFile(String path);
}
